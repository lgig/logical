# logical

A Ruby implementation of some mathematical logic concepts and algorithms.

It makes no attempts to be computationally efficient, it strives to be handy instead.

## Setup
### As a gem
As you would expect, add:

    gem 'logical'
to your `Gemfile`.

### Stand-alone
(coming soon)

## Usage
Build a formula (sorry, no parsing yet):

    p = Literal.new('p')
    q = Literal.new('q')
    r = Literal.new('r')

    f = Implication.new(Conjunction.new(p, q), r)
Print it:

    f.to_s    # "((p∧q)→r)"

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
Build the Docker image:

    docker build -t logical .

Launch a Docker container using the image, mounting the project directory:

    docker run --name=logical -d --mount type=bind,src=${PWD},target=/var/app logical

Implement your changes.

### Executing Tests
Launch Rake within the Docker container bash shell:

    docker exec -ti logical bash -c rake

## License

Logical is released under the [MIT License](https://opensource.org/licenses/MIT).