User.seed_once(:uid,
  { uid: 'root',
    password_digest: BCrypt::Password.create("password", cost: 4),
    admin: true,
    provider: 'local'}
)
