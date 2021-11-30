class AverageCalculateService

  def initialize(asset)
    @asset = asset
    @count = 0
    @sum = 0
  end

  def call
    @asset.stories.each do |story|
      if story.rating != nil
        @sum += story.rating
        @count += 1
      end
    end

    if @count == 0
      return nil
    else
      @sum / @count
    end
  end

end
