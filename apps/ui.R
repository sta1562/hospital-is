library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)

dashboardPage(
  title = "Hospital-IS",
  dashboardHeader(
    title = "Hospital-IS"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Daftar Pasien",
        tabName = "pasien",
        icon = icon("people-line")
      ),
      menuItem(
        "Daftar Dokter",
        tabName = "dokter",
        icon = icon("user-doctor")
      ),
      menuItem(
        "Kamar Tersedia",
        tabName = "kamar",
        icon = icon("house-user")
      ),
      menuItem(
        "Riwayat Pemeriksaan",
        tabName = "riwayat",
        icon = icon("house-medical")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "pasien",
        h2(
          "Daftar Pasien "
        ),
        dataTableOutput(
          outputId = "tblPasien"
        )
      ),
      tabItem(
        tabName = "dokter",
        h2(
          "Daftar Dokter"
        ),
        dataTableOutput(
          outputId = "tblDokter"
        )
      ),
      tabItem(
        tabName = "kamar",
        h2(
          "Kamar Tersedia"
        ),
        dataTableOutput(
          outputId = "tblKamar"
        )
      ),
      tabItem(
        tabName = "riwayat",
        h2(
          "Riwayat Pemeriksaan berdasarkan Dokter"
        ),
        uiOutput("loadDokter"),
        dataTableOutput(
          outputId = "tblRiwayat"
        )
      )
    )
  )
)