connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  
  # DB <- dbConnect(
  #   driver, dbname="hospital", host="localhost",port=5433,user="postgres", password="root"
  # )
  
  DB <- dbConnect(
    driver,
    dbname="ywvpyrxw", # User & Default database
    host="topsy.db.elephantsql.com", # Server
    # port=5433,
    user="ywvpyrxw", # User & Default database
    password="fAPCgC4Oi8OCqQVgn8drpRrgEDUz_yB5" # Password
  )
}

function(input, output, session) {
  output$tblPasien <- renderDataTable({
    DB <- connectDB()
    pasien<-dbReadTable(DB, 'pasien')
    dbDisconnect(DB)
    
    pasien
  })
  
  output$tblDokter <- renderDataTable({
    DB <- connectDB()
    dokter<-dbReadTable(DB, 'dokter')
    dbDisconnect(DB)
    
    dokter
  })
  
  output$tblKamar <- renderDataTable({
    DB <- connectDB()
    kamar<-dbReadTable(DB, 'kamar')
    dbDisconnect(DB)
    
    kamar
  })
  
  listDr <- reactive({
    DB <- connectDB()
    dokter<-dbReadTable(DB, 'dokter')
    dbDisconnect(DB)
    
    dokter$nama_dokter
  })
  
  output$loadDokter <- renderUI({
    selectInput("listDokter", "Dokter", choices = listDr())
  })
  
  output$tblRiwayat <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT p.id_pasien, p.nama, d.nama_dokter, d.spesialis FROM tindakan AS t, dokter AS d, pasien AS p WHERE t.id_dokter = d.id_dokter AND p.id_pasien = t.id_pasien AND d.nama_dokter = '", as.character(input$listDokter), "';")
    rs <- dbGetQuery(DB, q)  
    
    dbDisconnect(DB)
    
    rs
  })
  
}
