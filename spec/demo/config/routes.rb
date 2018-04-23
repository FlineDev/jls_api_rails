require 'jls_api'

Rails.application.routes.draw do
  # JLS:API router invocation
  jls_api :v1
end
