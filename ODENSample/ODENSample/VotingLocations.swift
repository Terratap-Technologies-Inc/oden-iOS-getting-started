// Copyright 2018 TerraTap Technologies Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import EVReflection

public class VotingLocations : EVObject
{
    public var type : String?
    public var features : [Feature]?
    
    public class Feature : EVObject
    {
        public var type : String?
        public var geometry : Geometry?
        public var properties : Properties?
        
        public class Geometry : EVObject
        {
            public var type : String?
            public var coordinates: [Double]?
        }
        
        public class Properties : EVObject
        {
            public var name : String?
            public var address : String?
            public var location : String?
            public var advancedOnly : Bool = false
            public var accessibilty : String?
            public var transitStop : NSNumber?
        }
    }
    
    public static func getVotingLocations(from url: URL!) throws -> VotingLocations 
    {
        let json = try String(contentsOf: url, encoding: .utf8)        
        let data = VotingLocations(json: json)
    
        return data
    }
}
