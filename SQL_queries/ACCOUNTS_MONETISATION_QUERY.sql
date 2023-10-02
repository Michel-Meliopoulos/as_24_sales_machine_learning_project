WITH cantons_2 AS (
  SELECT 
    new_canton_id,
    new_name AS canton_name,
    new_short_name AS canton_code
  FROM `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`),

cantons_3 AS (
  SELECT 
    new_canton_id,
    new_name AS canton_name,
    new_short_name AS canton_code
  FROM `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`)

SELECT  
  account_id,
  account_number,
  new_as_member_id,
  name AS account_name,
  new_as_sales_segmentation,
  new_as_segmentation_current,
  new_as_subgroup_id AS subgroup_id,
  `smg-data-automotive-production.dw_clean_crm.new_as_groupbase_clean`.new_as_name AS subgroup_name,
  new_is_key_account,
  email_address1,
  email_address2,
  email_address3,
  new_address3_line1,
  new_address3_postal_code,
  new_address3_city,
  `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`.new_canton_id AS canton_id,
  `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`.new_name AS canton,
  `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`.new_short_name AS canton_code,
  cantons_2.new_canton_id AS canton_2_id,
  cantons_2.canton_name AS canton_2,
  cantons_2.canton_code AS canton_2_code,
  cantons_3.new_canton_id AS canton_3_id,
  cantons_3.canton_name AS canton_3,
  cantons_3.canton_code AS canton_3_code,
  new_as_betreuer_id,
  `smg-data-automotive-production.dw_clean_crm.systemuserbase_clean`.full_name,
  new_as_business_relationship,
  new_as_company_status,
  new_ms_company_status,
  new_as_dealer_size,
  is_private
 

FROM `smg-data-automotive-production.dw_clean_crm.accountbase_clean`
LEFT JOIN `smg-data-automotive-production.dw_clean_crm.new_as_groupbase_clean`
  ON `smg-data-automotive-production.dw_clean_crm.new_as_groupbase_clean`.new_as_group_id = `smg-data-automotive-production.dw_clean_crm.accountbase_clean`.new_as_subgroup_id

LEFT JOIN `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`
  ON `smg-data-automotive-production.dw_clean_crm.new_cantonbase_clean`.new_canton_id = `smg-data-automotive-production.dw_clean_crm.accountbase_clean`.new_canton_id

LEFT JOIN cantons_2
  ON cantons_2.new_canton_id = `smg-data-automotive-production.dw_clean_crm.accountbase_clean`.new_canton2_id

LEFT JOIN cantons_3
  ON cantons_3.new_canton_id = `smg-data-automotive-production.dw_clean_crm.accountbase_clean`.new_canton3_id

LEFT JOIN `smg-data-automotive-production.dw_clean_crm.systemuserbase_clean` 
  ON `smg-data-automotive-production.dw_clean_crm.systemuserbase_clean`.system_user_id = `smg-data-automotive-production.dw_clean_crm.accountbase_clean`.new_as_betreuer_id