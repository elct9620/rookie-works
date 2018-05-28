# frozen_string_literal: true

ActiveAdmin.register Game do
  includes project: %i[school department]

  controller do
    actions :all, except: %i[edit destroy]
  end

  index do
    index_column
    column :project
    column :school do |game|
      game.project.school.name
    end
    column :department do |game|
      game.project.department.name
    end
    column :platform do |game|
      game.platform.map do |platform|
        t("game.platform.#{platform}")
      end.join(', ')
    end
    column :genre do |game|
      t("game.genre.#{game.genre}")
    end
    column :download_link do |game|
      link_to_if game.download_link.present?,
                 '下載',
                 game.download_link,
                 target: '_blank'
    end
  end

  csv do
    column :project do |game|
      game.project.name
    end
    column :school do |game|
      game.project.school.name
    end
    column :department do |game|
      game.project.department.name
    end
    column :platform do |game|
      game.platform.map do |platform|
        t("game.platform.#{platform}")
      end.join(', ')
    end
    column :genre do |game|
      t("game.genre.#{game.genre}")
    end
    column :download_link
  end

  preserve_default_filters!
  filter :download_link_present, as: :boolean, label: '有試玩版'
end
