

SET FOREIGN_KEY_CHECKS = 0;
 
drop table if exists  actor,  address, category, city, country ,customer ,film , inventory,language , staff     ,store,  film_actor, film_category, film_text, payment , rental ; 

drop view if exists actor_info,customer_list ,film_list ,nicer_but_slower_film_list , sales_by_film_category, sales_by_store ,staff_list ;

SET FOREIGN_KEY_CHECKS = 1;