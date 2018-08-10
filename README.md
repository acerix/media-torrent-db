# Media Torrent Database

Sqlite3 database schema for storing torrent video information.

## Basic Usage

1. Create database from schema

  sqlite3 media-torrent-db.sqlite < schema.sql

2. Import data

  python3 import.py https://raw.githubusercontent.com/acerix/public-domain-media-db/master/movies.csv
  python3 import.py https://raw.githubusercontent.com/acerix/public-domain-media-db/master/shows.csv

3. Export data

  sqlite3 -header -csv media-torrent-db.sqlite < export-movies.sql > my-movies.csv
  sqlite3 -header -csv media-torrent-db.sqlite < export-shows.sql > my-shows.csv

## Project Links

- [Project website](https://github.com/acerix/media-torrent-db)
- [Documentation](https://github.com/acerix/media-torrent-db/wiki)
- [Support](https://github.com/acerix/media-torrent-db/issues)
- [Changelog](CHANGELOG.md)
- [License](LICENSE)

## Latest Version

- https://raw.githubusercontent.com/acerix/media-torrent-db/master/schema.sql
