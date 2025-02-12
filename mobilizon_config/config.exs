# mobilizon_config/config.exs
import Config

config :mobilizon, :federation, enabled: false
config :mobilizon, Mobilizon.Federation, enabled: false


# Configure Ueberauth for Keycloak
config :ueberauth, Ueberauth,
  providers: [
    # The label here is 'keycloak'. 
    # This label will also be used in the URL path e.g. /auth/keycloak
    keycloak: {Ueberauth.Strategy.Keycloak, [default_scope: "openid email"]}
  ]

# Configure Keycloak OIDC details
keycloak_base_url = "http://localhost:8080"
config :ueberauth, Ueberauth.Strategy.Keycloak.OAuth,
  client_id: "mobilizon",
  client_secret: "CHANGE_ME_TO_SOME_SECRET", # must match realm import file
  site: keycloak_base_url,
  authorize_url: "#{keycloak_base_url}/auth/realms/mobilizon-realm/protocol/openid-connect/auth",
  token_url: "#{keycloak_base_url}/auth/realms/mobilizon-realm/protocol/openid-connect/token",
  userinfo_url: "#{keycloak_base_url}/auth/realms/mobilizon-realm/protocol/openid-connect/userinfo",
  token_method: :post

# You can keep other default config as is, or add more as needed.
# This file is loaded by the Docker image if we mount it at /etc/mobilizon/config.exs
