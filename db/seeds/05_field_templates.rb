# frozen_string_literal: true

# db/seeds.rb
FieldTemplate.create([
                       { name: 'build', dropdown: true },
                       { name: 'cock girth', dropdown: true },
                       { name: 'cock length', dropdown: true },
                       { name: 'dominance', dropdown: true },
                       { name: 'drinker', dropdown: true },
                       { name: 'drug user', dropdown: true },
                       { name: 'drugs of choice', dropdown: true },
                       { name: 'hair color', dropdown: true },
                       { name: 'hair length/style', dropdown: true },
                       { name: 'hiv status', dropdown: true },
                       { name: 'kinks/fetishes', dropdown: false },
                       { name: 'location', dropdown: false },
                       { name: 'race', dropdown: true },
                       { name: 'sexual role', dropdown: true },
                       { name: 'smoker', dropdown: true },
                     ])

FieldTemplate.find_or_create_by(name: 'hiv status').field_values.create([
                                                                          { value: '[not entered]', description: 'the user hasn\'t entered a value for his HIV status', default: true },
                                                                          { value: '???', description: 'an unknown HIV status' },
                                                                          { value: 'neg (chasing)', description: '"HIV-negative, actively chasing HIV' },
                                                                          { value: 'neg (on PrEP)', description: 'HIV-negative, on pre-exposure prophylaxis' },
                                                                          { value: 'neg', description: 'HIV-negative' },
                                                                          { value: 'poz (undetectable)', description: 'HIV-positive, on medication, with an undetectable viral load' },
                                                                          { value: 'poz (toxic)', description: 'HIV-positive, not on medication, with a "toxic" viral load' },
                                                                          { value: 'poz', description: 'HIV-positive' },
                                                                          { value: 'other', description: 'Some other status not otherwise listed' },
                                                                        ])

FieldTemplate.find_or_create_by(name: 'sexual role').field_values.create([
                                                                           { value: '[not entered]', description: 'The user hasn\'t selected a sexual role (yet)', default: true },
                                                                           { value: 'total bottom', description: 'Never puts his dick in another man\'s ass; his dick is only for show or to flop around whilst he gets railed' },
                                                                           { value: 'bottom', description: 'Can top in an emergency' },
                                                                           { value: 'mostly bottom', description: 'Will top for the right guy' },
                                                                           { value: 'vers bottom', description: 'Predominantly bottom, but will top on occasion' },
                                                                           { value: 'versatile', description: 'Enjoys both fucking and getting fucked equally' },
                                                                           { value: 'vers top', description: 'Predominantly top, but enjoys bottoming on occasion' },
                                                                           { value: 'mostly top', description: 'Will bottom for the right guy' },
                                                                           { value: 'top', description: 'Will bottom on rare occasions' },
                                                                           { value: 'total top', description: 'Total top; no dick goes in his ass EVER' },
                                                                         ])

FieldTemplate.find_or_create_by(name: 'hair length/style').field_values.create([
                                                                                 { value: '[not entered]', description: 'The user hasn\'t selected a hair style (yet)', default: true },
                                                                                 { value: 'short', description: 'short' },
                                                                                 { value: 'military', description: 'military/crew cut' },
                                                                                 { value: 'bald', description: 'bald/shaved' },
                                                                                 { value: 'medium', description: 'medium length hair' },
                                                                                 { value: 'long', description: 'like a chick\s' },
                                                                               ])

FieldTemplate.find_or_create_by(name: 'hair color').field_values.create([
                                                                          { value: '[not entered]', description: 'The user hasn\'t selected a hair color (yet)', default: true },
                                                                          { value: 'bald', description: 'bald' },
                                                                          { value: 'black', description: 'black' },
                                                                          { value: 'blond', description: 'blond' },
                                                                          { value: 'brown', description: 'brown' },
                                                                          { value: 'dark blond', description: 'dark blond' },
                                                                          { value: 'dark brown', description: 'dark brown' },
                                                                          { value: 'dyed', description: 'dyed' },
                                                                          { value: 'gray', description: 'gray' },
                                                                          { value: 'light blond', description: 'light blond' },
                                                                          { value: 'light brown', description: 'light brown' },
                                                                          { value: 'other', description: 'some other color' },
                                                                          { value: 'red', description: 'auburn/red' },
                                                                        ])

FieldTemplate.find_or_create_by(name: 'build').field_values.create([
                                                                     { value: '[not entered]', description: 'The user hasn\'t selected a build (yet)', default: true },
                                                                     { value: 'skinny', description: 'a skinny/slim build' },
                                                                     { value: 'athletic', description: 'an athletic build' },
                                                                     { value: 'average', description: 'an average build' },
                                                                     { value: 'muscular', description: 'a muscular build' },
                                                                     { value: 'heavy-set', description: 'a heavy-set (i.e., fat) build' },
                                                                     { value: 'twink', description: 'a skinny smooth twinkish build' },
                                                                     { value: 'swimmers', description: 'a skinny athletic swimmers build' },
                                                                     { value: 'chub', description: 'a chubby (i.e., fat) build' },
                                                                     { value: 'bear', description: 'a bearish build' },
                                                                     { value: 'otter', description: 'an otterish (slim and hairy) build' },
                                                                   ])

FieldTemplate.find_or_create_by(name: 'race').field_values.create([
                                                                    { value: '[not entered]', description: 'The user hasn\'t selected a race (yet)', default: true },
                                                                    { value: 'white', description: 'Someone whose origins are in the original peoples of Europe' },
                                                                    { value: 'black', description: 'Someone whose ancestry is from any of the black racial groups of Africa' },
                                                                    { value: 'asian', description: 'Someone whose ancestry is generally Asian (e.g, Chinese, Korean, Japanese, Mongolian)' },
                                                                    { value: 'hispanic', description: 'Someone whose ancestry is generally from Latin America or Spain' },
                                                                    { value: 'american indian / alaskan native', description: 'Someone whose ancestry is ultimately Asian but whose ancestors came to the United States before Columbus' },
                                                                    { value: 'indian', description: 'Someone whose ancestry is generally from the Indian subcontinent' },
                                                                    { value: 'middle eastern', description: 'Someone whose origins are in the Middle East' },
                                                                    { value: 'native hawaiian/pacific islander', description: 'A person having origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands (and don\t skimp on the rum!)' },
                                                                    { value: 'other', description: 'Some other racial makeup' },
                                                                    { value: 'mutt', description: 'Someone whose racial identity is muddied by generations of cross-breeding' },
                                                                  ])

FieldTemplate.find_or_create_by(name: 'cock length').field_values.create([
                                                                           { value: '[not entered]', description: 'The user hasn\'t selected a cock length (yet)', default: true },
                                                                           { value: '½"', description: '½"' },
                                                                           { value: '1"', description: '1"' },
                                                                           { value: '1 ½"', description: '1 ½"' },
                                                                           { value: '2"', description: '2"' },
                                                                           { value: '2 ½"', description: '2 ½"' },
                                                                           { value: '3"', description: '3"' },
                                                                           { value: '3 ½"', description: '3 ½"' },
                                                                           { value: '4"', description: '4"' },
                                                                           { value: '4 ½"', description: '4 ½"' },
                                                                           { value: '5"', description: '5"' },
                                                                           { value: '5 ½"', description: '5 ½"' },
                                                                           { value: '6"', description: '6"' },
                                                                           { value: '6 ½"', description: '6 ½"' },
                                                                           { value: '7"', description: '7"' },
                                                                           { value: '7 ½"', description: '7 ½"' },
                                                                           { value: '8"', description: '8"' },
                                                                           { value: '8 ½"', description: '8 ½"' },
                                                                           { value: '9"', description: '9"' },
                                                                           { value: '9 ½"', description: '9 ½"' },
                                                                           { value: '10"', description: '10"' },
                                                                           { value: '10 ½"', description: '10 ½"' },
                                                                           { value: '11"', description: '11"' },
                                                                           { value: '11 ½"', description: '11 ½"' },
                                                                           { value: '12"', description: '12"' },
                                                                           { value: '12 ½"', description: '12 ½"' },
                                                                           { value: '> 12 ½"', description: '> 12 ½"' },
                                                                         ])

FieldTemplate.find_or_create_by(name: 'cock girth').field_values.create([
                                                                          { value: '[not entered]', description: 'The user hasn\'t selected a cock girth (yet)', default: true },
                                                                          { value: '½"', description: '½"' },
                                                                          { value: '¾"', description: '¾"' },
                                                                          { value: '1"', description: '1"' },
                                                                          { value: '1 ¼"', description: '1 ¼"' },
                                                                          { value: '1 ½"', description: '1 ½"' },
                                                                          { value: '2 ¾"', description: '2 ¾"' },
                                                                          { value: '2"', description: '2"' },
                                                                          { value: '2 ¼"', description: '2 ¼"' },
                                                                          { value: '2 ½"', description: '2 ½"' },
                                                                          { value: '2 ¾"', description: '2 ¾"' },
                                                                          { value: '3"', description: '3"' },
                                                                          { value: '3 ¼"', description: '3 ¼"' },
                                                                          { value: '3 ½"', description: '3 ½"' },
                                                                          { value: '3 ¾"', description: '3 ¾"' },
                                                                          { value: '4"', description: '4"' },
                                                                          { value: '4 ¼"', description: '4 ¼"' },
                                                                          { value: '4 ½"', description: '4 ½"' },
                                                                          { value: '4 ¾"', description: '4 ¾"' },
                                                                          { value: '5"', description: '5"' },
                                                                          { value: '5 ¼"', description: '5 ¼"' },
                                                                          { value: '5 ½"', description: '5 ½"' },
                                                                          { value: '5 ¾"', description: '5 ¾"' },
                                                                          { value: '6"', description: '6"' },
                                                                          { value: '6 ¼"', description: '6 ¼"' },
                                                                          { value: '6 ½"', description: '6 ½"' },
                                                                          { value: '6 ¾"', description: '6 ¾"' },
                                                                          { value: '7"', description: '7"' },
                                                                          { value: '7 ¼"', description: '7 ¼"' },
                                                                          { value: '7 ½"', description: '7 ½"' },
                                                                          { value: '7 ¾"', description: '7 ¾"' },
                                                                          { value: '8"', description: '8"' },
                                                                          { value: '8 ¼"', description: '8 ¼"' },
                                                                          { value: '8 ½"', description: '8 ½"' },
                                                                          { value: '8 ¾"', description: '8 ¾"' },
                                                                          { value: '9"', description: '9"' },
                                                                          { value: '9 ¼"', description: '9 ¼"' },
                                                                          { value: '9 ½"', description: '9 ½"' },
                                                                          { value: '9 ¾"', description: '9 ¾"' },
                                                                          { value: '10"', description: '10"' },
                                                                          { value: '> 10"', description: '> 10"' },
                                                                        ])

FieldTemplate.find_or_create_by(name: 'smoker').field_values.create([
                                                                      { value: '[not entered]', description: 'The user hasn\'t selected whether he smokes (yet)', default: true },
                                                                      { value: 'yes, heavily', description: 'the user smokes a lot' },
                                                                      { value: 'yes', description: 'the user smokes' },
                                                                      { value: 'socially', description: 'the user smokes when he\'s out with friends' },
                                                                      { value: 'quitting', description: 'the user is trying to quit smoking' },
                                                                      { value: 'no', description: 'the user doesn\'t smoke' },
                                                                      { value: 'fuck no', description: 'the user has never touched a cigarette in his life' },
                                                                    ])

FieldTemplate.find_or_create_by(name: 'drinker').field_values.create([
                                                                       { value: '[not entered]', description: 'The user hasn\'t selected whether he drinks alcohol (yet)', default: true },
                                                                       { value: 'alcoholic', description: 'the user is an alcoholic' },
                                                                       { value: 'yes, heavily', description: 'the user drinks a lot' },
                                                                       { value: 'yes', description: 'the user drinks alcohol' },
                                                                       { value: 'socially', description: 'the user drinks alcohol when he\'s out with friends' },
                                                                       { value: 'quitting', description: 'the user is trying to quit drinking' },
                                                                       { value: 'no', description: 'the user doesn\'t drink alcohol' },
                                                                       { value: 'in recovery', description: 'the user is in recovery from alcoholism' },
                                                                       { value: 'teetotaler', description: 'the user has never touched alcohol' },
                                                                     ])

FieldTemplate.find_or_create_by(name: 'dominance').field_values.create([
                                                                         { value: '[not entered]', description: 'The user hasn\'t selected how \"dominant\" he is (yet)', default: true },
                                                                         { value: 'total faggot', description: '100% fag - A total submissive faggot.  Not a bone of dominance in its body.  He lives omly to serve at the feet of real Alpha Men.' },
                                                                         { value: 'faggot',
                                                                           description: '90% fag/10% dom - A faggot that knows its place in this world is at the feet of real Alpha Men.  No dominance in its body, save for a fleeting glimmer of self-confidence before it comes to its senses and ' \
                                                                                        'remembers its true place and purpose.' },
                                                                         { value: 'mostly fag', description: '80% fag/20% dom - Mostly a faggot.  Might stand up for itself once in a while but it\'s not comfortable doing it and looks hella dumb trying.' },
                                                                         { value: 'sub', description: '70% sub/30% dom - Submissive, but not a faggot.  Has some self-respect.  Stands up for himself occasionally and has his own life apart from the Alphas whom he serves.' },
                                                                         { value: 'switchy sub', description: '60% sub/40% dom - Switchy sub.  A switch who leans sub.  Might dom occasionally, but prefers to be sub.' },
                                                                         { value: 'switch', description: '50% sub/50% dom - Equal parts dom and sub.' },
                                                                         { value: 'switchy dom', description: '60% dom/40% sub - Switchy dom.  A switch who leans dom.  Might sub occasionally, but prefers to be dom.' },
                                                                         { value: 'dom', description: '70% dom/30% sub - Predominantly dominant, but might enjoy subbing for the right guy or under the right circumstances.' },
                                                                         { value: 'mostly dom', description: '80% dom/20% sub - Mostly dominant, but not an arrogant asshole about it.  Knows how to let his hair down on occasion.' },
                                                                         { value: 'beta dom', description: '90% dom/10% sub - Mostly dominant; might defer (but never submit) to an alpha dom' },
                                                                         { value: 'alpha dom', description: '100% dom - Total dominant arrogant as fuck Alpha male.  This man exudes dominance whenever he walks into a room.  He NEVER submits.  To anyone.' },
                                                                       ])

FieldTemplate.find_or_create_by(name: 'drug user').field_values.create([
                                                                         { value: '[not entered]', description: 'The user hasn\'t selected whether he uses recreational drugs (yet)',
                                                                           default: true },
                                                                         { value: 'addict', description: 'the user is a drug addict' },
                                                                         { value: 'junkie', description: 'the user is a junkie' },
                                                                         { value: 'yes, heavily', description: 'the user uses recreational drugs a lot' },
                                                                         { value: 'yes', description: 'the user uses recreational drugs' },
                                                                         { value: 'socially', description: 'the user uses recreational drugs when he\'s out with friends' },
                                                                         { value: 'quitting', description: 'the user is trying to quit using recreational drugs' },
                                                                         { value: 'no', description: 'the user doesn\'t use recreational drugs' },
                                                                         { value: 'in recovery', description: 'the user is in recovery from drug addiction' },
                                                                         { value: 'fuck no', description: 'the user has never and will never use recreational drugs' },
                                                                       ])

FieldTemplate.find_or_create_by(name: 'drugs of choice').field_values.create([
                                                                               { value: '[not entered]', description: 'the user hasn\'t entered any drugs of choice (yet)', default: true },
                                                                             ])

FieldTemplate.find_or_create_by(name: 'kinks/fetishes').field_values.create([
                                                                              { value: '[not entered]', description: 'the user hasn\'t entered any kinks or fetishes (yet)', default: true },
                                                                            ])
