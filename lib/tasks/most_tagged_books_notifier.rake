desc "emails the information of most tagged top 3 books"

task most_tagged_books_notifier: :environment do
  NotificationWorker.most_tagged_books_notifier
end
