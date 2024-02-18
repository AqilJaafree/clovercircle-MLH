pub contract BasicNFT {
  pub var totalSupply: UInt64
  

  init(){
    self.totalSupply = 0
     

   }

  pub resource interface NFTPublic  {
     pub fun getID(): UInt64
      pub fun getPOST() : String
  }

  pub resource NFT : NFTPublic {
      pub let id : UInt64
      pub let metadata: {String: String}

      
      init(InitPost:String){
        self.id = BasicNFT.totalSupply
        self.metadata = {"POST" : InitPost}
        BasicNFT.totalSupply = BasicNFT.totalSupply + 1
      
      }

      pub fun getID() : UInt64 {
        return self.id
      }

      pub fun getPOST() : String {
        return self.metadata["POST"]!
      }
  }  

  pub fun createNFT(post:String): @NFT{
    return <- create NFT(InitPost: post)
  
  }
}