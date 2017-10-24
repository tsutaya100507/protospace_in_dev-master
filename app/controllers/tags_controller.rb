class TagsController < ApplicationController

  def index
    @dup_tags = Tag.pluck(:title)

    @tags = Tag.uniq.pluck(:title)

    @tags_list = []

    for i in @tags do
      count = 0
        for j in @dup_tags do
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
