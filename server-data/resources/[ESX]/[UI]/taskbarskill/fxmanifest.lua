fx_version "adamant"
game "gta5"
lua54 'yes'
ui_page 'index.html'

files {
  "index.html",
  "js/scripts.js",
  "js/jquery.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"