if Rails.env.development? || Rails.env.test? || Rails.env.staging?
  Stripe.api_key = "sk_test_JmzVWvq3XPy3ILxJJrGg8Sao"
  STRIPE_PUBLISHABLE_KEY = "pk_test_XfS3clm6Vu4Uhyne1zheh4lV"
else
  Stripe.api_key = "sk_live_hKn3GQGUxwfSp1zU6fO8FW2X"
  STRIPE_PUBLISHABLE_KEY = "pk_live_GMpAJtBVaEM89F4af1CHfLTy"
end