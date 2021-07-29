description = "${{ github.event.pull_request.body }}"
issue_no = /## PBI Issue\s+- #(?<issue_no>\d+)/.match(description)[:issue_no]

issue = JSON.parse(`curl -H "authorization: Bearer ${{ github.token }}" \
"https://api.github.com/repos/${{ github.repository }}/issues/#{issue_no}"`)

if issue["labels"].any?{|label| label["name"] == "PBI" } && !issue["milestone"].empty?
  params = {milestone: issue["milestone"]["number"]}
  `curl -X PATCH -H "authorization: Bearer ${{ github.token }}" \
  -d #{Shellwords.escape(params.to_json)} \
  "https://api.github.com/repos/${{ github.repository }}/issues/${{ github.event.pull_request.number }}"`
end
