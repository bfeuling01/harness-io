# CREATE CLUBHOUSE STORY

export STORY_ID=`curl -X POST -L "${API_URL}/stories?token=${SECRET}" -H "Content-Type: application/json" -d "{\"comments\": [{ \"text\": \"Deployment URL: ${deploymentUrl}.\n${service.name} deploying to ${env.name}.\nTriggered by: ${deploymentTriggeredBy}\" }], \"description\": \"Artifact: ${artifact.metadata.image}\", \"name\": \"Deploying ${service.name}\", \"project_id\": 2, \"story_type\": \"chore\" }" | jq -r '.id'`
