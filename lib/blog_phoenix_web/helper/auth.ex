defmodule BlogPhoenixWeb.Helper.Auth do
    
    def signed_in?(conn) do
        user_id = Plug.Conn.get_session(conn, :current_user_id)
        if user_id, do: !!BlogPhoenix.Repo.get(BlogPhoenix.Accounts.User, user_id)
        if is_nil(user_id) do 
            false
        else
            true
        end
    end

    def allowmod(conn, postid) do
        user_id = Plug.Conn.get_session(conn, :current_user_id)
        if not is_nil(user_id) and not is_nil(postid) do
           user_id == postid
        else
            false
        end
    end
end