# Twitter

Time expent: About 3.5h 

Like Twitter app, implemented over a main layout.

All the requirements are develop in the logic and tested in the terminal. I had no time to finish the follow/unfollow view for an issue with the Search form that I'll take a look afterwards. 

Use Case that has to be checked in from console:

Follow/Unfollow

```
irb(main):003:0> a = User.first;
irb(main):004:0* b = User.last;
irb(main):005:0* a.follow(b)
  User Load (0.4ms)  SELECT  `users`.* FROM `users`  ORDER BY `users`.`id` ASC LIMIT 1
  User Load (0.3ms)  SELECT  `users`.* FROM `users`  ORDER BY `users`.`id` DESC LIMIT 1
  User Exists (0.3ms)  SELECT `users`.* FROM `users` INNER JOIN `follows` ON `users`.`id` = `follows`.`followed_id` WHERE `follows`.`follower_id` = 1 AND `users`.`id` = 100
   (0.1ms)  BEGIN
  SQL (0.3ms)  INSERT INTO `follows` (`followed_id`, `follower_id`, `created_at`, `updated_at`) VALUES (100, 1, '2015-04-28 06:47:40.664982', '2015-04-28 06:47:40.664982')
   (6.4ms)  COMMIT
=> #<Follow id: 88, follower_id: 1, followed_id: 100, created_at: "2015-04-28 06:47:40", updated_at: "2015-04-28 06:47:40">
irb(main):003:0> a.unfollow(b)
  Follow Load (0.3ms)  SELECT  `follows`.* FROM `follows` WHERE `follows`.`follower_id` = 1 AND `follows`.`followed_id` = 100 LIMIT 1
   (0.1ms)  BEGIN
  SQL (1.2ms)  DELETE FROM `follows` WHERE `follows`.`id` = 88
   (0.3ms)  COMMIT
=> #<Follow id: 88, follower_id: 1, followed_id: 100, created_at: "2015-04-28 06:47:41", updated_at: "2015-04-28 06:47:41">

```
