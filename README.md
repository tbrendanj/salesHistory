# README

This is a quick project to let me generate sortable data on hypothetical sales that can be exported to be inserted into something like PowerBI for analysis. 

# Ruby Version

ruby 3.4.10

rails 8.1.3

# Dependencies

Aside from the defaults when starting a new Ruby project, I also added the CSV gem.

# Running the project

Clone the project. Then run:
```
bundle install
bin/rails db:create
bin/rails server
```

# Testing

```
bin/rails test
bin/rails test:system
```

# Future

Additions I hope to eventually make:

API for directly querying data out of this application into data tools, rather than relying on CSV export and manual import

Additional integration/system test assertions to cover everything that should happen at specific points such as page renders

Styling the application into looking like a professionally used internal tool

# Deployment

Not tried for this application at this time; kamal would likely just work as this one's on the simple side.
