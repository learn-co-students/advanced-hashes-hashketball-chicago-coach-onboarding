require 'pry'


def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        {
          name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        {
          name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        {
          name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        {
          name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        {
          name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        },
      ],
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        {
          name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        {
          name: 'Bismak Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        {
          name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        {
          name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        {
          name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12,
        }
      ]
    }
  }
end

def find_team(team_name)
  game_hash.each do |team, info|
    return info if info[:team_name] == team_name
  end
end

def find_player(player_name)
  game_hash.each do |team, info|
    info[:players].each do |player_info|
      return player_info if player_name == player_info[:name]
    end
  end
end

def num_points_scored(player)
  find_player(player)[:points]
end

def shoe_size(player)
  find_player(player)[:shoe]
end

def team_colors(team)
  find_team(team)[:colors]
end

def team_names
  game_hash.map do |team, info|
    info[:team_name]
  end
end

def player_numbers(team)
  find_team(team)[:players].map do |player|
    player[:number]
  end
end

def player_stats(player)
  find_player(player).reject { |item| item == :name }
end

def big_shoe_rebounds
  current_biggest_shoe = 0
  current_rebounds = 0
  game_hash.each do |team, info|
    info[:players].each do |player_info|
      if player_info[:shoe] > current_biggest_shoe
        current_biggest_shoe = player_info[:shoe]
        current_rebounds = player_info[:rebounds]
      end
    end
  end
  current_rebounds
end
