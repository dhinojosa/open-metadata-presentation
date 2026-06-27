# ... existing code ...

create_user() {
  local name="$1"
  local display_name="$2"
  local email="$3"
  local description="$4"

  echo "Creating user: ${display_name} <${email}>"

  response_file="$(mktemp)"
  status_code="$(
    curl -sS \
      -o "${response_file}" \
      -w "%{http_code}" \
      -X PUT "${OPENMETADATA_API_URL}/v1/users" \
      -H "Authorization: Bearer ${OPENMETADATA_JWT_TOKEN}" \
      -H "Content-Type: application/json" \
      -d "{
        \"name\": \"${name}\",
        \"displayName\": \"${display_name}\",
        \"email\": \"${email}\",
        \"description\": \"${description}\"
      }"
  )"

  if [[ "${status_code}" == "200" || "${status_code}" == "201" ]]; then
    echo "  OK: ${email}"
  elif [[ "${status_code}" == "409" ]]; then
    echo "  Already exists: ${email}"
  else
    echo "  ERROR: Failed to create ${email}. HTTP ${status_code}"
    echo "  Response:"
    cat "${response_file}"
    echo
  fi

  rm -f "${response_file}"
}

wait_for_openmetadata

create_user "priya" "Priya Patel" "priya@abccorp.com" "Customer Domain Data Owner"
create_user "jamal" "Jamal Washington" "jamal@abccorp.com" "Ordering Domain Data Owner"
create_user "aisha" "Aisha Hassan" "aisha@abccorp.com" "Inventory Domain Data Owner"
create_user "mei" "Mei Chen" "mei@abccorp.com" "Data Governance Lead"
create_user "miguel" "Miguel Rodriguez" "miguel@abccorp.com" "Platform Engineering Shared Services"
create_user "steven" "Steven Appleton" "steven@abccorp.com" "Data Engineering Shared Services"

echo
echo "Done loading OpenMetadata demo users."
echo
echo "NOTE: The documented OpenMetadata Create User API does not set Basic Auth passwords."
echo "Set passwords through the OpenMetadata UI/password reset flow if these users need to log in."
