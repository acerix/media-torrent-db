SELECT
  movie.id,
  movie.title,
  movie.synopsis,
  (
  SELECT
    GROUP_CONCAT(genre.name)
  FROM
    genre
  JOIN
    movie_genre
      ON
        movie_genre.genre_id = genre.id
      AND
        movie_genre.movie_id = movie.id
  ) genres,
  movie.theater_release_year,
  movie.theater_release_date,
  movie.online_release_date,
  movie.minutes_long,
  content_rating.name content_rating,
  movie_release.name release_name,
  release_format.name release_format,
  video_quality.name video_quality,
  torrent.hash info_hash,
  movie_release_video.filename video_filename
FROM
  movie_release_video
JOIN
  torrent
    ON
      torrent.id = movie_release_video.torrent_id
JOIN
  movie_release
    ON
      movie_release.id = movie_release_video.movie_release_id
JOIN
  movie
    ON
      movie.id = movie_release.movie_id
LEFT JOIN
  content_rating
    ON
      content_rating.id = movie.content_rating_id
JOIN
  release_format
    ON
      release_format.id = movie_release.release_format_id
JOIN
  video_quality
    ON
      video_quality.id = movie_release.video_quality_id
ORDER BY
  movie.id,
  movie_release.id,
  movie_release_video.id
;
