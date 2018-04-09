SELECT
  series.id,
  series.title series_title,
  series.synopsis series_synopsis,
  (
  SELECT
    GROUP_CONCAT(genre.name)
  FROM
    genre
  JOIN
    series_genre
      ON
        series_genre.genre_id = genre.id
      AND
        series_genre.series_id = series.id
  ) genres,
  content_rating.name content_rating,
  series_season.number season,
  series_season_episode.number episode,
  series_season_episode.title,
  series_season_episode.synopsis,
  series_season_episode.minutes_long,
  series_season_episode.release_date,
  series_season_episode_release.name release_name,
  release_format.name release_format,
  video_quality.name video_quality,
  torrent.hash info_hash,
  series_season_episode_release_video.filename video_filename
FROM
  series_season_episode_release_video
JOIN
  torrent
    ON
      torrent.id = series_season_episode_release_video.torrent_id
JOIN
  series_season_episode_release
    ON
      series_season_episode_release.id = series_season_episode_release_video.episode_release_id
JOIN
  series_season_episode
    ON
      series_season_episode.id = series_season_episode_release.episode_id
JOIN
  series_season
    ON
      series_season.id = series_season_episode.series_season_id
JOIN
  series
    ON
      series.id = series_season.series_id
LEFT JOIN
  content_rating
    ON
      content_rating.id = series.content_rating_id
JOIN
  release_format
    ON
      release_format.id = series_season_episode_release.release_format_id
JOIN
  video_quality
    ON
      video_quality.id = series_season_episode_release.video_quality_id
ORDER BY
  series.id,
  series_season_episode_release.id,
  series_season_episode_release_video.id
;
