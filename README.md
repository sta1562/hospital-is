
<div align="center">

![Logo](https://via.placeholder.com/150x150)

# Judul Projek Database

[Tentang](#scroll-overview)
•
[Screenshot](#rice_scene-screenshot)
•
[Demo](#dvd-demo)
•
[Dokumentasi](#blue_book-documentation)

</div>

## :bookmark_tabs: Menu

- [Tentang](#scroll-overview)
- [Screenshot](#rice_scene-screenshot)
- [Demo](#dvd-demo)
- [Dokumentasi](#blue_book-documentation)
- [Requirements](#exclamation-requirements)
- [Skema Database](#floppy_disk-skema-database)
- [ERD](#rotating_light-erd)
- [Deskripsi Data](#heavy_check_mark-deskripsi-data)
- [Struktur Folder](#open_file_folder-stuktur-folder)
- [Tim Pengembang](#smiley_cat-tim-pengembang)

## :scroll: Tentang

Deskripsi tentang projek database yang dikerjakan.

Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut praesentium neque assumenda! Tempore culpa nihil laborum distinctio vel, illo quod veniam. Excepturi soluta beatae sed iusto sunt, impedit ducimus dignissimos?

## :rice_scene: Screenshot

![Logo](https://via.placeholder.com/750x500)

## :dvd: Demo

Lorem ipsum dolor sit amet consectetur, adipisicing elit.

| url                      | login          | password |
| ------------------------ | -------------- | -------- |
| http://shinyapps.io/hospital | admin@mail.com | 123      |

## :blue_book: Dokumentasi 

Dokumentasi penggunaan aplikasi database. Anda dapat juga membuat dokumentasi lives menggunakan readthedocs.org (opsional).

## :exclamation: Requirements

- Cantumkan paket R yang digunakan
- RDBMS yang digunakan
- [Node](https://nodejs.org/en/download/)
- [PHP](https://php.net/)

## :floppy_disk: Skema Database

<img width="242" alt="skema update" src="https://user-images.githubusercontent.com/111562803/223139863-0f7b7950-6586-49aa-9e6c-5c756d2a0375.png">


## :rotating_light: ERD

<img width="242" alt="skema update" src="https://github.com/Kelompok4MDS/Project-Praktikum-MDS/blob/main/ERD%20Liga%20Inggris.png?raw=true">

## :heavy_check_mark: Deskripsi Data

Berisi tentang tabel-tabel yang digunakan berikut dengan sintaks SQL DDL (CREATE).

Contoh:

### 1. Tabel *yo_user*

Tabel *yo_user* merupakan tabel yang memuat data demografi panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute    | Type                  | Description                     |
|:-------------|:----------------------|:--------------------------------|
| id           | character varying(10) | Id panelis                      |
| uid          | character varying(8)  | Unique id panelis               |
| username     | character varying(30) | Username                        |
| firstname    | character varying(15) | Firstname                       |
| lastname     | character varying(15) | Lastname                        |
| gender       | smallint              | Jenis kelamin                   |
| province_id  | character varying(10) | Asal provinsi                   |
| city_id      | character varying(10) | Asal kota                       |
| birthdate    | timestamp             | Tanggal lahir                   |
| linkshare_id | character varying(10) | Informasi join melalui campaign |

### Create Table yo_user

```sql
CREATE TABLE IF NOT EXISTS public.yo_user
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    uid character varying(8) COLLATE pg_catalog."default" NOT NULL,
    username character varying(30) COLLATE pg_catalog."default" NOT NULL,
    firstname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    gender smallint DEFAULT '0'::smallint,
    province_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    city_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    birthdate timestamp without time zone,
    linkshare_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT '0'::smallint,
    CONSTRAINT yo_user_pkey PRIMARY KEY (id),
    CONSTRAINT yo_user_city_id_fkey FOREIGN KEY (city_id)
        REFERENCES public.yo_region_city (city_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_user_linkshare_id_fkey FOREIGN KEY (linkshare_id)
        REFERENCES public.yo_linkshare (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_user_province_id_fkey FOREIGN KEY (province_id)
        REFERENCES public.yo_region_province (id_province) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

## :open_file_folder: Struktur Folder

```
.
├── app           # ShinyApps
│   ├── css
│   │   ├── **/*.css
│   ├── server.R
│   └── ui.R
├── data 
│   ├── csv
│   │   ├── **/*.css
│   └── sql
|       └── db.sql
├── src           # Project source code
├── doc           # Doc for the project
├── .gitignore
├── LICENSE
└── README.md
```

## :smiley_cat: Tim Pengembang

- [@walternascimentobarroso](https://walternascimentobarroso.github.io/)
- Full-Stack Developer: [Alfa Nugraha](https://github.com/alfanugraha) G1501211013
