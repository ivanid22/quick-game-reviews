module GameReviewsHelper
  def all_reviews_desc
    GameReview.all.includes(:author).order('created_at DESC')
  end
end
