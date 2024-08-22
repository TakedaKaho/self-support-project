class ApplicationController < ActionController::Base
  # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      user_path(resource)
    else
      root_path # デフォルト
    end
  end

  # サインアウト後のリダイレクト先を指定
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end