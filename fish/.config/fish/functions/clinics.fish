function clinics
    set -l oidc_client_id='jane'
    set -l oidc_client_secret=$(op read 'op://Employee/OIDC Client/credential')
    set -l jane_id_user_staging=$(op read 'op://Employee/Jane ID Staging/username')
    set -l jane_id_pass_staging=$(op read 'op://Employee/Jane ID Staging/password')
end
