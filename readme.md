# logical
A Ruby implementation of some mathematical logic concepts and algorithms.

It makes no attempts to be computationally efficient, it strives to be handy instead.

## Setup
logical is built as a gem for Ruby apps, but if you just wish to execute it in an interactive session there's a convenience standalone Docker image available.

### As a gem
Add:

    gem 'logical'

to your application's `Gemfile` or run:

    gem install logical
(See [RubyGems](https://rubygems.org/gems/logical))

### As a docker container
> Requires [Docker](https://www.docker.com/).

Clone the repository and run:

    docker build -t logical .
    docker run -it logical

## Usage
Require the gem:

    require 'logical'

Include the module:

    include 'Logical'

Parse a formula:

    f = NaiveParser.parse('((p∧q)→r)')

> NaiveParser requires formulas to be enclosed within parentheses (i.e `(p∧q)`, not `p∧q`).

Alternatively, build a formula:

    p = Literal.new(:p)
    q = Literal.new(:q)
    r = Literal.new(:r)

    f = Implication.new(Conjunction.new(p, q), r)

Serialize it:

    f.to_s    # '((p∧q)→r)'

Get its rank:

    f.rank    # => 2

Check for equality (not equivalence):

    f == p    # => false
    f == f    # => true

Build a truth table for it and print it:

    t = TruthTable.new(f)
    puts t.evaluations.map(&:to_s)

Output:

    {"p"=>true, "q"=>true, "r"=>true} ⇒ ((p∧q)→r) = true
    {"p"=>true, "q"=>true, "r"=>false} ⇒ ((p∧q)→r) = false
    {"p"=>true, "q"=>false, "r"=>true} ⇒ ((p∧q)→r) = true
    {"p"=>true, "q"=>false, "r"=>false} ⇒ ((p∧q)→r) = true
    {"p"=>false, "q"=>true, "r"=>true} ⇒ ((p∧q)→r) = true
    {"p"=>false, "q"=>true, "r"=>false} ⇒ ((p∧q)→r) = true
    {"p"=>false, "q"=>false, "r"=>true} ⇒ ((p∧q)→r) = true
    {"p"=>false, "q"=>false, "r"=>false} ⇒ ((p∧q)→r) = true

Get some info:

    t.valid?        # false
    t.satisfied?    # true
    t.invalid?      # false

## Contributing
### Setup
Build the Docker development image:

    docker build -f Dockerfile.dev -t logical-dev .

Launch a Docker container mounting the project directory:

    docker run --name=logical-dev -d --mount type=bind,src=${PWD},target=/var/app logical-dev

Implement your changes.

### Executing Tests
Launch Rake within the Docker container bash shell:

    docker exec -ti logical-dev bash -c rake

## License

logical is released under the [MIT License](https://opensource.org/licenses/MIT).
