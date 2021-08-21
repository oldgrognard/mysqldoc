drop function if exists strip_tags;

create function strip_tags($str longtext) returns longtext
begin
    declare $start, $end INT default 1;
    loop
        set $start = locate("<", $str, $start);
        if (!$start) then return $str; end if;
        set $end = locate(">", $str, $start);
        if (!$end) then set $end = $start; end if;
        set $str = insert($str, $start, $end - $start + 1, "");
    end loop;
end;

alter table product
    add description_no_html varchar(8000) default '' not null after description;

start transaction;
update product
set description_no_html = left(strip_tags(ifnull(description, '')), 8000);
commit;

select sku,
       mfrPartNumber,
       title,
       substr(description, locate('src="', description, locate('<video', description)) + 5,
              locate('"', description, locate('src="', description, locate('<video', description)) + 5) -
              locate('src="', description, locate('<video', description)) - 5) as video
from product
where description like '%<video%'
union
select sku,
       mfrPartNumber,
       replace(replace(title, '"', '”'), ',', '‚')                              as title,
       substr(description, locate('src="', description, locate('<iframe', description)) + 5,
              locate('"', description, locate('src="', description, locate('<iframe', description)) + 5) -
              locate('src="', description, locate('<iframe', description)) - 5) as video
from product
where description like '%youtube%'
  and sku not in ('447026', '471980', '480244', '490362', '499896')
into outfile '/var/lib/mysql-files/hw_video_export.csv' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n';


select 'Style #'                   as style,
       'Default Image'             as default_image,
       'Attribute Specific Image'  as attribute_specific_image,
       'Alt Images'                as alt_images,
       'Product Name'              as product_name,
       'Product Description Short' as product_description_short,
       'Product Description Long'  as product_description_long,
       'Is Featured Item'          as is_featured_item,
       'Gender'                    as gender,
       'Age Group'                 as age_group,
       'Product Page Title'        as product_page_title,
       'Product Meta Description'  as product_meta_description,
       'Product Search Keywords'   as product_search_keywords,
       'Product Video Embed'       as product_video_embed,
       'Weight'                    as weight,
       'Recommended Item #1'       as recommended_1,
       'Recommended Item #2'       as recommended_2,
       'Recommended Item #3'       as reocmmended_3,
       'Recommended Item #4'       as recommended_4,
       'Recommended Item #5'       as reocmmended_5,
       'Recommended Item #6'       as reocommended6
union all
select p.sku                                                               as style,
       p2.productImageName                                                 as default_image,
       ''                                                                  as attribute_specific_image,
       ifnull(group_concat(p3.productImageName order by p3.sortOrder), '') as alt_images,
       p.shortDescription                                                  as product_name,
       left(p.description_no_html, 2000)                                   as product_description_short,
       p.description_no_html                                               as product_description_long,
       if(p.isFeatured = true, 'YES', 'NO')                                as is_featured_item,
       'UNISEX'                                                            as gender,
       'adult'                                                             as age_group,
       concat('Hobby Works: ', p.title)                                    as product_page_title,
       ''                                                                  as product_meta_description,
       ''                                                                  as product_search_keywords,
       ''                                                                  as product_video_embed,
       ''                                                                  as weight,
       substr(replace(relatedSkus, ' ', ''), 1, 6)                         as recommended_1,
       substr(replace(relatedSkus, ' ', ''), 8, 6)                         as recommended_2,
       substr(replace(relatedSkus, ' ', ''), 15, 6)                        as recommended_3,
       substr(replace(relatedSkus, ' ', ''), 22, 6)                        as recommended_4,
       substr(replace(relatedSkus, ' ', ''), 29, 6)                        as recommended_5,
       substr(replace(relatedSkus, ' ', ''), 36, 6)                        as recommended_6
from product p
         left outer join productimage p2 on p.sku = p2.fk_productId and p2.sortOrder = 1
         left outer join productimage p3 on p.sku = p3.fk_productId and p3.sortOrder <> 1
group by p.sku, p2.productImageName
into outfile '/var/lib/mysql-files/hw_export.csv' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n';

/* ===================================== */
select max(length(description))
from product;

select replace(relatedSkus, ' ', '')
from product
where length(relatedSkus) > 6;

select * from product where sku = '499896';




