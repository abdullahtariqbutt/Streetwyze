class Average

  def initialize(asset)
    @asset = asset
    @count = 0
    @sum = 0
  end

  def rating_avg
    calulate_avg_rating
  end

  private

    def calulate_avg_rating
      @asset.stories.each do |story|
        if story.rating != nil
          @sum = @sum + story.rating
          @count = @count + 1
        end
      end

      if @count == 0
        return nil
      else
        @sum/@count
      end
    end

end
