# load "./lib/graphql-docs/make_docs.rb"

file = File.new("./lib/graphql-docs/schema.idl", "w")
file.write GraphQL::Schema::Printer.print_schema(MyappSchema)
file.close

GraphQLDocs.build(
  filename: "./lib/graphql-docs/schema.idl",
  delete_output: true,
  output_dir: "./public/docs/",
  base_url: "/docs"
)
