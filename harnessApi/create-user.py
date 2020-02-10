###############################################
# TITLE: Harness - Add Users
# CREATED BY: Bryan Feuling
# DATE: 2/10/2020
# DESCRIPTION: This script gives an admin the
#   ability to add a User to Harness by first
#   querying the Harness API to get Group IDs
#   then allowing the user to add a set of
#   of users by adding the appropriate Group ID
#   to an Excel doc and then running a parser
#   against the Excel doc
###############################################

import requests, json, csv, tkinter
from os.path import expanduser
from tkinter import filedialog
from py2graphql import Query, Client

home = expanduser("~")

print('What is your Harness Account ID? Example: URL = https://app.harness.io/#/account/987238413kjdhbvkwer, Account ID = 987238413kjdhbvkwer')
accountID = input()
print(accountID)
URL = ('https://app.harness.io/gateway/api/graphql?accountId=%s' % accountID)
print(URL)

print('What is your Harness API Key?')
apiKey = input()
print(apiKey)

print('Please have a CSV ready with the User information in the following order: Name, Email, and GroupID\n')
input('Press Enter to Proceed')

print('First, we will need to get your Harness AccountID and Harness API Key to proceed\n')

print('Next, we will query the Harness API to get the User Group IDs and Names, which you will need to assign in the last two columns of your CSV\n')

payload = "{\"query\":\"{\\n  userGroups(limit: 1000, offset: 0) {\\n    nodes {\\n      id,\\n      name\\n    }\\n  }\\n}\",\"variables\":{}}"
headers = {
  'Content-Type': 'application/json',
  'x-api-key': apiKey,
  'Accept': '*/*',
  'Cache-Control': 'no-cache',
  'Host': 'app.harness.io'
}

response = requests.request("POST", URL, headers=headers, data = payload)
for r in response.json()['data']['userGroups']['nodes']:
  print('Name: %s' % r['name'])
  print('ID: %s' % r['id'])
  print('\n')

print('Please Copy/Paste the appropriate Group ID and Group Name to the last columns of the User CSV\n')
input('Press Enter to Proceed')

print('Where is your user csv file?')
root = tkinter.Tk()
root.withdraw()
file_path = filedialog.askopenfilename()
print(file_path)

with open(file_path) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 1
    for row in csv_reader:
      name = row[0]
      email = row[1]
      groupId = row[2]
      headers = {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'Accept': '*/*',
        'Cache-Control': 'no-cache',
        'Host': 'app.harness.io',
        'Accept-Encoding': 'gzip, deflate, br'
      }
      payload = "{\"query\":\"mutation createUser($user: CreateUserInput!) {\\n  createUser(input: $user) {\\n    user {\\n      id\\n      email\\n      name\\n      userGroups(limit: 5) {\\n        nodes {\\n          id\\n          name\\n        }\\n      }\\n    }\\n    clientMutationId\\n  }\\n}\",\"variables\":{\"user\":{\"name\":\"" + name + "}\",\"email\":\"" + email + "\",\"userGroupIds\":[\"" + groupId + "\"]}}}"
      response = requests.request("POST", URL, headers=headers, data=payload.encode('utf-8'))
      line_count += 1
