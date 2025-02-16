def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.select(:id, :title, :yr, :score).where(score: 3..5, yr: 1980..1989)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  # SELECT yr
  # FROM movies
  # WHERE yr NOT IN (
  #   SELECT yr
  #   FROM movies
  #   WHERE score > 8
  # )


  Movie.select(:yr).distinct.where.not(yr: Movie.select(:yr).where('score > 8')).pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor.joins(:movies).select(:id, :name).where(movies: {title: title}).order('castings.ord')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear i  n the 'actors' table.
  Movie.joins(:actors).select(:id, :title, 'actors.name').where('castings.ord = 1').where('actors.id = director_id')
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor.select(:id, :name, 'COUNT(*) as roles').where.not('castings.ord = 1').order('COUNT(*) DESC').limit(2).joins(:castings).group('actors.id')
end
