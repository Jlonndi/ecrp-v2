fx_version 'cerulean'
game 'gta5'

data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'

-- client_script 'data/**/vehicle_names.lua'

files {
    'data/**/*.meta',
    'data/vehiclelayouts.meta'
}

client_script 'vehicle_names.lua'