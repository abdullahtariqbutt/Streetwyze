module StoriesHelper
  def calulate_avg_rating(map_asset)
    avg = 0
    count = 0
    sum = 0
    map_asset.stories.each do |story|
      if story.rating != nil
        sum = sum + story.rating
        count = count + 1
      end
    end
    avg = sum/count
  end
end
