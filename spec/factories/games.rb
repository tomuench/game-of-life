FactoryGirl.define do

  factory :game_random, class: Game do
    height 3
    width 3
    random_build true
  end

  factory :game do
    height 3
    width 5

    after(:create) do |game, _evaluator|
      create_list(:cell_dead, 1, game: game, x: 0, y: 0)
      create_list(:cell_alive, 1, game: game, x: 1, y: 0)
      create_list(:cell_dead, 1, game: game, x: 2, y: 0)
      create_list(:cell_dead, 1, game: game, x: 3, y: 0)
      create_list(:cell_dead, 1, game: game, x: 4, y: 0)

      create_list(:cell_alive, 1, game: game, x: 0, y: 1)
      create_list(:cell_alive, 1, game: game, x: 1, y: 1)
      create_list(:cell_alive, 1, game: game, x: 2, y: 1)
      create_list(:cell_dead, 1, game: game, x: 3, y: 1)
      create_list(:cell_dead, 1, game: game, x: 4, y: 1)

      create_list(:cell_alive, 1, game: game, x: 0, y: 2)
      create_list(:cell_dead, 1, game: game, x: 1, y: 2)
      create_list(:cell_dead, 1, game: game, x: 2, y: 2)
      create_list(:cell_dead, 1, game: game, x: 3, y: 2)
      create_list(:cell_dead, 1, game: game, x: 4, y: 2)
    end
  end

  factory :cell_alive, class: Cell do
    alive true
  end

  factory :cell_dead, class: Cell do
    alive false
  end
end
