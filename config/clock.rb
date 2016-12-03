require 'clockwork'
module Clockwork

  every(1.minute, 'Delete Messages') {
  `rake post_tasks:delete_posts`
  }

end