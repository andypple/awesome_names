module NameLists
  class Create
    UID_LENGTH = 12

    def initialize(uid: nil, viewed_at: nil)
      @uid = uid || SecureRandom.base58(UID_LENGTH)
      @viewed_at = viewed_at || Time.current
    end

    def call
      NameList.create(uid: @uid, viewed_at: @viewed_at)
    end
  end
end
