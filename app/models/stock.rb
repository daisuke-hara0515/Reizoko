class Stock < ApplicationRecord
    with_options presence: true do
        validates :name
        validates :stock
        validates :unit
    end

    belongs_to :user

    def self.import(file) # self.メソッド名はクラスメソッド
        # foreachはファイルを一気に展開するのではなく、1行ずつ展開するのでメモリ消費を抑えられる。
        # headers: trueはCSVファイルの項目名？をヘッダ(データでは無い)として扱ってくれる
        CSV.foreach(file.path, headers: true) do |row|
            stock = find_by(id: row["id"]) || new
            # attributesはインスタンスを「属性名→値」のハッシュとして取り出せる
            # sliceメソッドは引数で指定されたキーとその値だけを含むHashを返す
            stock.attributes = row.to_hash.slice(*updatable_attributes)
            stock.save
        end
    end

    def self.updatable_attributes
        ["id","name","stock","unit","memo","expire_date"]
    end

end
