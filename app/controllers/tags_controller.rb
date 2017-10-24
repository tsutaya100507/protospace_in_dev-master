class TagsController < ApplicationController

  def index
    @tags_all = Tag.all
    @tags = @tags_all.uniq.pluck(:title)
    @new_array = @tags
    @tags_list = []

    for i in @new_array do
    count = 0
      for j in @tags_all do
        if i == j
          count += 1
        @tags_list << count
        end
      end
    end
  end

  def show
  end

  def new
    @tag = Tag.new(tag_params)
  end
end
