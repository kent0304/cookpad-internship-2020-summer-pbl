User.destroy_all
Image.destroy_all
Post.destroy_all

user_image1 = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/users/user1.jpg')),
  filename: 'user.jpg'
)
user_image2 = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/users/user2.jpg')),
  filename: 'user.jpg'
)
user_image3 = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/users/user3.jpg')),
  filename: 'user.jpg'
)
user_image4 = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/users/user4.jpg')),
  filename: 'user.jpg'
)

users = []
users << User.create!(name: "Kent", image_id: user_image1.id, intro: "京都で一人暮らししています。料理は初心者。", password_digest: DigestGenerator.digest("password")) 
users << User.create!(name: "hoge ", image_id: user_image2.id, intro: "最近はスイーツ作りにハマってます。", password_digest: DigestGenerator.digest("password")) 
users << User.create!(name: "foo", image_id: user_image3.id, intro: "自炊頑張りたい。", password_digest: DigestGenerator.digest("password")) 
users << User.create!(name: "bar", image_id: user_image4.id, intro: "お菓子作りが好き", password_digest: DigestGenerator.digest("password")) 

applepie_image = Image.create!(
  body: File.binread(Rails.root.join('app/assets/images/foods/applepie.jpg')),
  filename: 'applepie.jpg'
)
Post.create!(
    name: "アップルパイ",
    user_id: 1,
    image_id: applepie_image.id,
)

asameshi_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/asameshi.jpg')),
filename: 'asameshi.jpg'
)
Post.create!(
    name: "目玉焼きパン",
    user_id: 2,
    image_id: asameshi_image.id,
)

bowl_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/bowl.jpg')),
filename: 'bowl.jpg'
)
Post.create!(
    name: "海鮮丼",
    user_id: 3,
    image_id: bowl_image.id,
)

choko_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/choko.jpg')),
filename: 'choko.jpg'
)
Post.create!(
    name: "チョコレートケーキ",
    user_id: 4,
    image_id: choko_image.id,
)

cinamon_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/cinamon.jpg')),
filename: 'cinamon.jpg'
)
Post.create!(
    name: "シナモンドーナツ",
    user_id: 1,
    image_id: cinamon_image.id,
)

gyoza_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/gyoza.jpg')),
filename: 'gyoza.jpg'
)
Post.create!(
    name: "餃子",
    user_id: 2,
    image_id: gyoza_image.id,
)

kopa_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/kopa.jpg')),
filename: 'kopa.jpg'
)
Post.create!(
    name: "クッパ",
    user_id: 3,
    image_id: kopa_image.id,
)

macaron_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/macaron.jpg')),
filename: 'macaron.jpg'
)
Post.create!(
    name: "マカロン",
    user_id: 4,
    image_id: macaron_image.id,
)

muffin_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/muffin.jpg')),
filename: 'muffin.jpg'
)
Post.create!(
    name: "マフィン",
    user_id: 2,
    image_id: muffin_image.id,
)

pasta_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/pasta.jpg')),
filename: 'pasta.jpg'
)
Post.create!(
    name: "パスタ",
    user_id: 3,
    image_id: pasta_image.id,
)

sake_image = Image.create!(
body: File.binread(Rails.root.join('app/assets/images/foods/sake.jpg')),
filename: 'sake.jpg'
)
Post.create!(
    name: "サーモンのムニエル",
    user_id: 4,
    image_id: sake_image.id,
)
