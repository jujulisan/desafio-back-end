class NormalizeTransaction
  def initialize(file)
    @file = file
  end

  def run
    file_extract
  end

  private 
    def file_extract
      @file.open.each_line do |line|
        Transaction.create!(
          kind_transaction: find_kind(line[0]),
          store: create_store(line[62..80], line[48..61]),
          value: line[9..18].to_f/100,
          cpf: line[19..29],
          card: line[30..41],
          occurred_time: date_normalized(line)
        )
      end
    end

    def date_normalized(line)
      DateTime.new(
        line[1..4].to_i, 
        line[5..6].to_i, 
        line[7..8].to_i,
        line[42..43].to_i, 
        line[44..45].to_i, 
        line[46..47].to_i
      ).utc
    end

    def find_kind(kind)
      KindTransaction.find_by(kind: kind.to_i) 
    end

    def create_store(name, owner)
      Store.where(
        name: name.strip,
        owner_name: owner.strip
      ).first_or_create
    end
end