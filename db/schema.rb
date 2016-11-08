# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161102102958) do

  create_table "absences", primary_key: "ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "Username",  limit: 50
    t.string  "StoreID",   limit: 50
    t.string  "Absence",   limit: 10, null: false
    t.float   "Latitude",  limit: 53
    t.float   "Longitude", limit: 53
    t.string  "Remarks"
    t.integer "Timestamp",            null: false
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["Timestamp"], name: "Timestamp", using: :btree
    t.index ["Username"], name: "UserID", using: :btree
  end

  create_table "cities", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "RegionID",               null: false
    t.integer "ProvinceID",             null: false
    t.string  "Region",     limit: 50,  null: false
    t.string  "Province",   limit: 100, null: false
    t.string  "City",       limit: 100, null: false
  end

  create_table "distributors", primary_key: "ID", id: :string, limit: 50, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "Username",     limit: 50,  default: "", null: false
    t.string  "Name",         limit: 50,  default: "", null: false
    t.string  "BuildingName", limit: 50,  default: "", null: false
    t.string  "Address",                  default: "", null: false
    t.string  "Phone",        limit: 50,  default: "", null: false
    t.string  "Email",        limit: 100, default: "", null: false
    t.string  "City",         limit: 50,  default: "", null: false
    t.string  "Country",      limit: 2,   default: "", null: false
    t.integer "Timestamp",                default: 0,  null: false
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "issues", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "Username",      limit: 50,   null: false
    t.string  "StoreName",     limit: 100,  null: false
    t.string  "BrandName",     limit: 100,  null: false
    t.string  "ProgramName",   limit: 100,  null: false
    t.date    "CampaignStart",              null: false
    t.date    "CampaignEnd",                null: false
    t.string  "Remarks",       limit: 1000, null: false
    t.float   "Latitude",      limit: 53,   null: false
    t.float   "Longitude",     limit: 53,   null: false
    t.integer "Pictures",      limit: 1,    null: false
    t.integer "Timestamp",                  null: false
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "masterdealers", primary_key: "ID", id: :string, limit: 50, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "CityID",                   default: 0,  null: false
    t.string  "Username",     limit: 50,  default: "", null: false
    t.string  "Name",         limit: 50,  default: "", null: false
    t.string  "BuildingName", limit: 50,  default: "", null: false
    t.string  "Address",                  default: "", null: false
    t.string  "Phone",        limit: 50,  default: "", null: false
    t.string  "Email",        limit: 100, default: "", null: false
    t.integer "Timestamp",                default: 0,  null: false
    t.index ["CityID"], name: "CityID", using: :btree
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "pending_sellout", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "ChannelManager",  limit: 50, null: false
    t.string  "TeamLeader",      limit: 50, null: false
    t.string  "Promoter",        limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["Salesman"], name: "Salesman", using: :btree
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "provinces", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "RegionID",             null: false
    t.string  "Region",   limit: 50,  null: false
    t.string  "Province", limit: 100, null: false
    t.index ["RegionID", "Province"], name: "RegionID", unique: true, using: :btree
  end

  create_table "regions", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "Region", limit: 50, null: false
  end

  create_table "sellin", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["ProductType", "ProductName", "QuarterYear", "Quarter", "QuarterWeek"], name: "ProductType", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellin_bk", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["ProductType", "ProductName", "QuarterYear", "Quarter", "QuarterWeek"], name: "ProductType", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellin_last", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["ProductType", "ProductName", "QuarterYear", "Quarter", "QuarterWeek"], name: "ProductType", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellin_last2", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["ProductType", "ProductName", "QuarterYear", "Quarter", "QuarterWeek"], name: "ProductType", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellout", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "ChannelManager",  limit: 50, null: false
    t.string  "TeamLeader",      limit: 50, null: false
    t.string  "Promoter",        limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
    t.index ["ChannelManager"], name: "ChannelManager", using: :btree
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["Promoter"], name: "Promoter", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["Salesman"], name: "Salesman", using: :btree
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["TeamLeader"], name: "TeamLeader", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellout_bk", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "ChannelManager",  limit: 50, null: false
    t.string  "TeamLeader",      limit: 50, null: false
    t.string  "Promoter",        limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
    t.index ["ChannelManager"], name: "ChannelManager", using: :btree
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["Promoter"], name: "Promoter", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["Salesman"], name: "Salesman", using: :btree
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["TeamLeader"], name: "TeamLeader", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellout_last", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["Salesman"], name: "Salesman", using: :btree
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellout_last2", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["Salesman"], name: "Salesman", using: :btree
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellthrough", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.string  "MasterDealerID",  limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "TxnDocType",      limit: 7,   null: false
    t.string  "TxnDocID",        limit: 50,  null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellthrough_bk", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.string  "MasterDealerID",  limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "TxnDocType",      limit: 7,   null: false
    t.string  "TxnDocID",        limit: 50,  null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "sellthrough_last", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.string  "MasterDealerID",  limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "TxnDocType",      limit: 7,   null: false
    t.string  "TxnDocID",        limit: 50,  null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["MasterDealerID"], name: "MasterDealerID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "stores", primary_key: "ID", id: :string, limit: 50, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "CityID",                                       null: false
    t.string  "ChannelManager",      limit: 50
    t.string  "TeamLeader",          limit: 50
    t.string  "Promoter",            limit: 50
    t.string  "SalesRepresentative", limit: 50
    t.string  "Merchandiser",        limit: 50
    t.string  "Username",            limit: 50,  default: "", null: false
    t.string  "Name",                limit: 50,  default: "", null: false
    t.string  "Category",            limit: 50,  default: "", null: false
    t.string  "BuildingName",        limit: 50,  default: "", null: false
    t.string  "Address",                         default: "", null: false
    t.string  "Phone",               limit: 50,  default: "", null: false
    t.string  "Email",               limit: 100, default: "", null: false
    t.integer "Timestamp",                       default: 0,  null: false
    t.index ["ChannelManager"], name: "ChannelManager", using: :btree
    t.index ["CityID"], name: "CityID", using: :btree
    t.index ["Merchandiser"], name: "Merchandiser", using: :btree
    t.index ["Promoter"], name: "Promoter", using: :btree
    t.index ["SalesRepresentative"], name: "SalesRepresentative", using: :btree
    t.index ["TeamLeader"], name: "TeamLeader", using: :btree
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "stores_last", primary_key: "ID", id: :string, limit: 50, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "CityID",                                  null: false
    t.string  "ChannelManager", limit: 50
    t.string  "TeamLeader",     limit: 50
    t.string  "Promoter",       limit: 50
    t.string  "Username",       limit: 50,  default: "", null: false
    t.string  "Name",           limit: 50,  default: "", null: false
    t.string  "Category",       limit: 50,  default: "", null: false
    t.string  "BuildingName",   limit: 50,  default: "", null: false
    t.string  "Address",                    default: "", null: false
    t.string  "Phone",          limit: 50,  default: "", null: false
    t.string  "Email",          limit: 100, default: "", null: false
    t.integer "Timestamp",                  default: 0,  null: false
    t.index ["ChannelManager"], name: "ChannelManager", using: :btree
    t.index ["CityID"], name: "CityID", using: :btree
    t.index ["Promoter"], name: "Promoter", using: :btree
    t.index ["TeamLeader"], name: "TeamLeader", using: :btree
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "stores_remarks", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "StoreID",   limit: 50,    null: false
    t.string  "Username",  limit: 50,    null: false
    t.text    "Remarks",   limit: 65535, null: false
    t.integer "Timestamp",               null: false
    t.index ["StoreID"], name: "StoreID", using: :btree
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "tmp", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "a", null: false
    t.string "b", null: false
    t.string "c", null: false
    t.string "d", null: false
    t.string "e", null: false
    t.string "f", null: false
  end

  create_table "tmp2", primary_key: "a", id: :string, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "b", null: false
    t.string "c", null: false
    t.string "d", null: false
    t.string "e", null: false
    t.string "f", null: false
  end

  create_table "tmp_sellin", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
    t.index ["DistributorID"], name: "DistributorID", using: :btree
    t.index ["ProductName"], name: "ProductName", using: :btree
    t.index ["QuarterYear", "Quarter", "QuarterWeek"], name: "QuarterYear", using: :btree
    t.index ["TransactionDate"], name: "TransactionDate", using: :btree
    t.index ["Year", "Month", "Day"], name: "Year", using: :btree
  end

  create_table "tmp_sellout", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50, null: false
    t.string  "MasterDealerID",  limit: 50, null: false
    t.string  "StoreID",         limit: 50, null: false
    t.string  "ChannelManager",  limit: 50, null: false
    t.string  "TeamLeader",      limit: 50, null: false
    t.string  "Promoter",        limit: 50, null: false
    t.string  "Salesman",        limit: 50, null: false
    t.date    "TransactionDate",            null: false
    t.integer "QuarterYear",                null: false
    t.integer "Quarter",         limit: 1,  null: false
    t.integer "QuarterWeek",     limit: 1,  null: false
    t.integer "Year",                       null: false
    t.integer "Month",           limit: 1,  null: false
    t.integer "Day",             limit: 1,  null: false
    t.bigint  "PriceIDR",                   null: false
    t.float   "PriceUSD",        limit: 53, null: false
    t.string  "Other1",                     null: false
    t.string  "Other2",                     null: false
    t.string  "Other3",                     null: false
    t.string  "Other4",                     null: false
    t.string  "Other5",                     null: false
  end

  create_table "tmp_sellthrough", primary_key: "ServiceTag", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "DistributorID",   limit: 50,  null: false
    t.string  "MasterDealerID",  limit: 50,  null: false
    t.date    "TransactionDate",             null: false
    t.integer "QuarterYear",                 null: false
    t.integer "Quarter",         limit: 1,   null: false
    t.integer "QuarterWeek",     limit: 1,   null: false
    t.integer "Year",                        null: false
    t.integer "Month",           limit: 1,   null: false
    t.integer "Day",             limit: 1,   null: false
    t.string  "TxnDocType",      limit: 7,   null: false
    t.string  "TxnDocID",        limit: 50,  null: false
    t.string  "PartNumber",      limit: 100, null: false
    t.string  "ProductType",     limit: 100, null: false
    t.string  "ProductName",     limit: 100, null: false
    t.string  "ProcessorType",   limit: 100, null: false
    t.string  "ProcessorName",   limit: 100, null: false
    t.string  "Other1",                      null: false
    t.string  "Other2",                      null: false
    t.string  "Other3",                      null: false
  end

  create_table "tokens", primary_key: "ID", id: :string, limit: 32, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "Username",  limit: 50, null: false
    t.integer "Timestamp",            null: false
    t.index ["Timestamp"], name: "Timestamp", using: :btree
    t.index ["Username"], name: "Username", using: :btree
  end

  create_table "users", primary_key: "Username", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "StoreID",      limit: 50
    t.string  "Password",     limit: 50,               null: false
    t.string  "Level",        limit: 20,               null: false
    t.string  "Position",     limit: 100
    t.string  "Name",         limit: 100,              null: false
    t.string  "Gender",       limit: 6,                null: false
    t.string  "Birthplace",   limit: 50
    t.date    "Birthday"
    t.string  "Email",        limit: 100
    t.string  "Phone",        limit: 50
    t.string  "PINBB",        limit: 10,  default: "", null: false
    t.string  "Address"
    t.string  "City",         limit: 50
    t.string  "RTeamLeader",  limit: 50,  default: "", null: false
    t.string  "RDistributor", limit: 50,               null: false
    t.string  "RCity",        limit: 50,               null: false
    t.string  "RFilter",      limit: 50,               null: false
    t.string  "RShow",        limit: 50,               null: false
    t.string  "RStart",       limit: 50,               null: false
    t.string  "REnd",         limit: 50,               null: false
    t.integer "Timestamp",                             null: false
    t.index ["StoreID"], name: "StoreID", using: :btree
  end

  create_table "users_cities", primary_key: "ID", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "Username", limit: 50, null: false
  end

  create_table "users_provinces", primary_key: "ID", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "Username", limit: 50, null: false
  end

end
