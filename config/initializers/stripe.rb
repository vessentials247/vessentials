Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_NLYXRqbHr3TLR859XO9BJaDF'],
  :secret_key      => ENV['sk_test_m5sFVwmv8zA9S4ExgWuzlB8v']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]