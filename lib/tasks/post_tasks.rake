namespace :post_tasks do
	desc "Deletes post"

	task :delete_post => :environment do
  	delete_posts
  end

	def delete_posts
    Post.all.each do |post|
    	if post.delete_at <= Time.now.utc
    		post.destroy
    	end
    end
  end
end
