User.destroy_all
Image.destroy_all
Post.destroy_all

users = []
3.times do |n|
    users << User.create!(name: "クックパッド#{n}", password_digest: DigestGenerator.digest("password")) 
end

image = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/food.jpeg')),
  filename: 'food.jpeg'
)

posts = []
%w[
  絶対失敗しないマカロン
  簡単に作れる肉じゃが
  美味しいアイスポックスクッキー
  混ぜるだけ！ベイクドチーズケーキ
  真っ白レアチーズケーキ
  しっとりダックワーズ
  基本のプレーンマフィン
  豆腐ドーナツ
  いつもの唐揚げ
  時間外フィナンシェ
].each do |post_name|
  user = users.sample
  posts << Post.create!(
    name: post_name,
    user_id: user.id,
    image_id: image.id,
    description: "#{post_name}を作ってみました"
  )
end