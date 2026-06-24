import SwiftUI
import UserNotifications

let privacyPolicyURL = URL(string: "https://example.com/privacy")!

struct StrategyQuote: Identifiable {
    let id = UUID()
    let quote: String
    let translation: String
    let wisdom: String
    let challenge: String
    let chapter: String
}

let strategyQuotes: [StrategyQuote] = [
    StrategyQuote(quote: "兵者，國之大事。", translation: "War is a matter of vital importance to the state.", wisdom: "Some decisions are too important to treat casually.", challenge: "Identify one decision today that deserves slower, clearer thinking.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "死生之地，存亡之道，不可不察也。", translation: "It is the ground of life and death, the path to survival or ruin.", wisdom: "High-stakes choices require honest assessment, not wishful thinking.", challenge: "Ask yourself: what is really at stake in one major decision?", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "道者，令民與上同意也。", translation: "The Way means people share the same purpose as their leader.", wisdom: "Alignment is the first source of strength.", challenge: "Clarify one shared goal with your team or family today.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "天者，陰陽、寒暑、時制也。", translation: "Heaven means timing, seasons, and conditions.", wisdom: "Even good ideas fail when the timing is wrong.", challenge: "Before pushing an idea today, ask: is this the right moment?", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "地者，遠近、險易、廣狹、死生也。", translation: "Earth means distance, danger, openness, and survival.", wisdom: "Context shapes strategy.", challenge: "Map the environment before choosing your next move.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "將者，智、信、仁、勇、嚴也。", translation: "The commander stands for wisdom, trust, humanity, courage, and discipline.", wisdom: "Leadership needs both heart and standards.", challenge: "Choose one leadership trait to practice deliberately today.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "法者，曲制、官道、主用也。", translation: "Method means organization, command, and resources.", wisdom: "Vision without operating discipline does not scale.", challenge: "Fix one small process that makes your work harder than it needs to be.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "兵者，詭道也。", translation: "All warfare is based on deception.", wisdom: "Do not judge only by what people say. Watch incentives and behavior.", challenge: "In one situation today, look at actions rather than words.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "能而示之不能，用而示之不用。", translation: "When able, appear unable; when active, appear inactive.", wisdom: "Not every strength needs to be advertised.", challenge: "Keep one capability quiet until it creates real value.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "近而示之遠，遠而示之近。", translation: "When near, appear far; when far, appear near.", wisdom: "Control expectations before others control the narrative.", challenge: "Think about what signal you are sending today.", chapter: "Chapter 1 · 始計篇"),

    StrategyQuote(quote: "利而誘之，亂而取之。", translation: "Lure with advantage; take them when they are in disorder.", wisdom: "Incentives reveal people quickly.", challenge: "Notice what people chase when a reward is visible.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "實而備之，強而避之。", translation: "If they are secure, prepare; if they are strong, avoid them.", wisdom: "Do not fight strength head-on just to prove a point.", challenge: "Find a smarter angle instead of forcing a direct fight.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "怒而撓之，卑而驕之。", translation: "If they are angry, disturb them; if humble, make them arrogant.", wisdom: "Emotion changes judgment.", challenge: "Do not let someone else’s emotion set your pace today.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "佚而勞之，親而離之。", translation: "If rested, tire them; if united, divide them.", wisdom: "Energy and trust are strategic assets.", challenge: "Protect one relationship or energy source that matters.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "攻其無備，出其不意。", translation: "Attack where they are unprepared; appear where unexpected.", wisdom: "Opportunity often lives where others are not looking.", challenge: "Look for one overlooked path today.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "夫未戰而廟算勝者，得算多也。", translation: "The side that wins before battle has made many calculations.", wisdom: "Good outcomes often look lucky from the outside.", challenge: "Prepare one important move before others see the need.", chapter: "Chapter 1 · 始計篇"),
    StrategyQuote(quote: "多算勝，少算不勝。", translation: "Many calculations lead to victory; few calculations lead to defeat.", wisdom: "Hope is not a plan.", challenge: "Write down three assumptions behind one plan today.", chapter: "Chapter 1 · 始計篇"),

    StrategyQuote(quote: "兵貴勝，不貴久。", translation: "In war, victory is valued, not prolonged campaigns.", wisdom: "Activity is not progress. Outcomes matter.", challenge: "Define what ‘done’ means before starting one task.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "久則鈍兵挫銳。", translation: "If the campaign is prolonged, weapons are dulled and spirit is weakened.", wisdom: "Long delays drain energy and value.", challenge: "End or simplify one effort that has dragged on too long.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "日費千金，然後十萬之師舉矣。", translation: "Only after great daily expense can a large army be raised.", wisdom: "Big moves consume resources faster than expected.", challenge: "Check the hidden cost of one project or commitment.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "兵聞拙速，未睹巧之久也。", translation: "There is cleverness in quick imperfection, but no wisdom in endless delay.", wisdom: "A good move now can beat a perfect move too late.", challenge: "Ship one useful draft instead of waiting for perfect.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "兵久而國利者，未之有也。", translation: "There has never been a prolonged war that benefited the state.", wisdom: "Dragging things out usually destroys value.", challenge: "Decide whether one ongoing debate needs a decision today.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "善用兵者，役不再籍，糧不三載。", translation: "The skilled leader does not raise troops twice or transport supplies three times.", wisdom: "Good planning avoids repeated rework.", challenge: "Prevent one avoidable rework loop before it starts.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "取用於國，因糧於敵。", translation: "Use home resources, but draw supplies from the enemy.", wisdom: "Use the system around you instead of carrying every burden yourself.", challenge: "Find one resource already available before asking for more.", chapter: "Chapter 2 · 作戰篇"),
    StrategyQuote(quote: "故智將務食於敵。", translation: "A wise commander makes use of the enemy's resources.", wisdom: "Pressure can be turned into fuel.", challenge: "Turn one constraint into an advantage today.", chapter: "Chapter 2 · 作戰篇"),

    StrategyQuote(quote: "上兵伐謀。", translation: "The highest form of warfare is to attack strategy.", wisdom: "Win by changing the plan, not just fighting the execution.", challenge: "Look upstream at one problem and challenge the strategy behind it.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "其次伐交。", translation: "Next best is to attack alliances.", wisdom: "Relationships often matter more than assets.", challenge: "Strengthen or understand one key relationship today.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "其次伐兵。", translation: "Next is to attack armies.", wisdom: "Direct conflict is rarely the best first move.", challenge: "Before confronting, ask what can be solved indirectly.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "其下攻城。", translation: "The worst policy is to attack cities.", wisdom: "Avoid expensive battles when smarter options exist.", challenge: "Identify one hard fight you may not need to fight.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "不戰而屈人之兵，善之善者也。", translation: "To subdue the enemy without fighting is the height of excellence.", wisdom: "The cleanest win is the conflict you never had to fight.", challenge: "Resolve one tension through alignment instead of force.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "知彼知己，百戰不殆。", translation: "Know the enemy and know yourself, and in a hundred battles you will never be in peril.", wisdom: "Understand both the challenge and your own limits.", challenge: "Before one important conversation, write down what both sides truly want.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "不知彼而知己，一勝一負。", translation: "Know yourself but not the enemy, and you will win some and lose some.", wisdom: "Self-confidence without external awareness is risky.", challenge: "Ask what you may be missing about the other side.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "不知彼，不知己，每戰必殆。", translation: "Know neither the enemy nor yourself, and every battle is dangerous.", wisdom: "Ignorance plus confidence is a dangerous combination.", challenge: "Pause one decision until you understand the facts better.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "知可以戰與不可以戰者勝。", translation: "He wins who knows when to fight and when not to fight.", wisdom: "Maturity is choosing the right battles.", challenge: "Choose one thing today not to fight.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "識眾寡之用者勝。", translation: "He wins who knows how to use both large and small forces.", wisdom: "Scale is useful only when used wisely.", challenge: "Use a small focused effort instead of a big noisy push.", chapter: "Chapter 3 · 謀攻篇"),

    StrategyQuote(quote: "上下同欲者勝。", translation: "He wins whose people share the same purpose.", wisdom: "Alignment beats scattered brilliance.", challenge: "Check whether your team is aligned on the actual goal.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "以虞待不虞者勝。", translation: "He wins who is prepared and waits for the unprepared.", wisdom: "Readiness quietly creates advantage.", challenge: "Prepare one thing before others realize it is needed.", chapter: "Chapter 3 · 謀攻篇"),
    StrategyQuote(quote: "將能而君不御者勝。", translation: "He wins when the commander is capable and not interfered with.", wisdom: "Capable people need space to execute.", challenge: "Give one capable person room to own the outcome.", chapter: "Chapter 3 · 謀攻篇"),

    StrategyQuote(quote: "先為不可勝，以待敵之可勝。", translation: "First make yourself invincible, then wait for the enemy's vulnerability.", wisdom: "Build your position before chasing opportunity.", challenge: "Strengthen one weakness before pursuing the next big move.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "不可勝在己，可勝在敵。", translation: "Invincibility depends on oneself; victory depends on the enemy.", wisdom: "Control your readiness. Opportunity comes later.", challenge: "Focus today on what you can directly control.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "不可勝者，守也；可勝者，攻也。", translation: "Invincibility lies in defense; victory lies in attack.", wisdom: "Protect the foundation before you push forward.", challenge: "Secure one foundation before taking on more risk.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "守則不足，攻則有餘。", translation: "Defend when strength is insufficient; attack when there is surplus.", wisdom: "Match ambition to capacity.", challenge: "Ask whether today is a protect day or a push day.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "勝兵先勝而後求戰。", translation: "Victorious warriors win first and then seek battle.", wisdom: "Preparation often decides the outcome before execution begins.", challenge: "Do one thing that improves your odds before the real work begins.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "敗兵先戰而後求勝。", translation: "Defeated warriors fight first and then seek victory.", wisdom: "Starting without readiness turns action into gambling.", challenge: "Do not begin one important task until the basics are ready.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "善戰者，勝於易勝者也。", translation: "The skilled warrior wins victories that are easy to win.", wisdom: "Great preparation makes success look simple.", challenge: "Make one task easier before trying to force it through.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "見勝不過眾人之所知，非善之善者也。", translation: "Seeing victory only when everyone sees it is not true excellence.", wisdom: "Real insight sees the path before it becomes obvious.", challenge: "Look for one early signal others may be missing.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "善守者，藏於九地之下。", translation: "The skilled defender hides beneath the deepest earth.", wisdom: "Sometimes strength is being hard to reach.", challenge: "Protect one critical asset quietly.", chapter: "Chapter 4 · 軍形篇"),
    StrategyQuote(quote: "善攻者，動於九天之上。", translation: "The skilled attacker strikes from the highest heaven.", wisdom: "When it is time to move, move decisively.", challenge: "When the opening appears today, do not hesitate.", chapter: "Chapter 4 · 軍形篇"),

    StrategyQuote(quote: "治眾如治寡，分數是也。", translation: "Managing many is like managing few; it is a matter of organization.", wisdom: "Complexity becomes manageable with structure.", challenge: "Create one simple structure that reduces confusion.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "鬥眾如鬥寡，形名是也。", translation: "Leading many in battle is like leading few; it is a matter of signals.", wisdom: "Communication turns size into strength.", challenge: "Make one signal clearer for the people around you.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "三軍之眾，可使必受敵而無敗者，奇正是也。", translation: "An army can withstand attack without defeat through normal and extraordinary forces.", wisdom: "Use discipline and creativity together.", challenge: "Pair one reliable method with one creative move.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "凡戰者，以正合，以奇勝。", translation: "Engage with the ordinary and win with the extraordinary.", wisdom: "Fundamentals get you in the game. Differentiation helps you win.", challenge: "Do the basics well, then add one unexpected value move.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "奇正相生，如循環之無端。", translation: "The ordinary and extraordinary give rise to each other endlessly.", wisdom: "Good strategy keeps changing the pattern.", challenge: "Break one stale pattern today.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "激水之疾，至於漂石者，勢也。", translation: "The rush of water that can move stones is momentum.", wisdom: "Momentum can make hard things move.", challenge: "Create momentum with one small visible win.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "鷙鳥之疾，至於毀折者，節也。", translation: "The strike of a bird of prey that breaks its target is timing.", wisdom: "Speed matters, but timing makes it powerful.", challenge: "Wait for the right moment, then act cleanly.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "善戰者，其勢險，其節短。", translation: "The skilled fighter creates dangerous momentum and short timing.", wisdom: "Create pressure, then act before it fades.", challenge: "Use one window of momentum before it disappears.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "故善戰者，求之於勢，不責於人。", translation: "The skilled commander seeks victory from the situation, not from blaming people.", wisdom: "Build systems that help people succeed.", challenge: "Fix one condition instead of blaming one person.", chapter: "Chapter 5 · 兵勢篇"),
    StrategyQuote(quote: "任勢者，其戰人也，如轉木石。", translation: "One who uses momentum sends people forward like rolling logs and stones.", wisdom: "When conditions are right, progress becomes easier.", challenge: "Set up the condition, not just the command.", chapter: "Chapter 5 · 兵勢篇"),

    StrategyQuote(quote: "善戰者，致人而不致於人。", translation: "The skilled commander makes others come to him and is not led by others.", wisdom: "Shape the situation instead of only reacting.", challenge: "Take one proactive step before others define the agenda.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "出其所不趨，趨其所不意。", translation: "Move where they do not go; go where they do not expect.", wisdom: "Do not compete in the most crowded lane.", challenge: "Find one uncontested path today.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "行千里而不勞者，行於無人之地也。", translation: "March a thousand miles without weariness by moving through undefended places.", wisdom: "The easiest path is often the least contested one.", challenge: "Avoid one unnecessary bottleneck.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "攻而必取者，攻其所不守也。", translation: "Attack and surely take what is not defended.", wisdom: "Find the gap instead of fighting the wall.", challenge: "Look for one neglected opportunity.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "守而必固者，守其所不攻也。", translation: "Defend and surely hold what cannot be attacked.", wisdom: "Design resilience into the foundation.", challenge: "Strengthen one thing others depend on but rarely see.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "微乎微乎，至於無形。", translation: "Be subtle, so subtle as to be formless.", wisdom: "The less predictable you are, the harder you are to counter.", challenge: "Avoid overexplaining one strategic move today.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "神乎神乎，至於無聲。", translation: "Be mysterious, so mysterious as to be silent.", wisdom: "Not every move needs noise.", challenge: "Let one result speak for itself.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "形人而我無形。", translation: "Make others reveal their form while you remain formless.", wisdom: "Understand others clearly without becoming too easy to read.", challenge: "Ask one question that reveals what someone really values.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "避實而擊虛。", translation: "Avoid strength and strike weakness.", wisdom: "Do not waste energy on the hardest battle.", challenge: "Find the weak point instead of proving your strength.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "兵無常勢，水無常形。", translation: "Military force has no constant shape, as water has no constant form.", wisdom: "Adapt to reality faster than others.", challenge: "Change one plan based on what is actually happening.", chapter: "Chapter 6 · 虛實篇"),
    StrategyQuote(quote: "水因地而制流，兵因敵而制勝。", translation: "Water shapes its flow by the ground; an army shapes victory by the enemy.", wisdom: "Fit the strategy to the situation.", challenge: "Do not copy someone else’s playbook today.", chapter: "Chapter 6 · 虛實篇"),

    StrategyQuote(quote: "軍爭為利，軍爭為危。", translation: "Maneuvering brings advantage and danger.", wisdom: "Opportunity always carries risk.", challenge: "Name both the upside and downside of one opportunity.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "以迂為直，以患為利。", translation: "Make the indirect route direct, and turn trouble into advantage.", wisdom: "A detour can become the smartest path.", challenge: "Turn one inconvenience into useful leverage.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "故不知諸侯之謀者，不能預交。", translation: "One who does not know others' plans cannot form alliances.", wisdom: "Partnership begins with understanding motives.", challenge: "Ask what success looks like for one potential partner.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "故兵以詐立，以利動。", translation: "An army is established by deception and moved by advantage.", wisdom: "People move when the incentive is clear.", challenge: "Clarify the incentive behind one request.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "其疾如風，其徐如林。", translation: "Be swift as the wind and calm as the forest.", wisdom: "Know when to move fast and when to stay patient.", challenge: "Choose whether one issue needs speed or patience today.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "侵掠如火，不動如山。", translation: "Attack like fire; remain immovable like a mountain.", wisdom: "Decisive action and steady discipline both matter.", challenge: "Be decisive on one thing and immovable on one principle.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "難知如陰，動如雷震。", translation: "Be hard to know as shadow; move like thunder.", wisdom: "Stay quiet until action matters.", challenge: "Prepare quietly, then move with clarity.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "三軍可奪氣，將軍可奪心。", translation: "An army may lose its spirit; a commander may lose composure.", wisdom: "Morale and mindset decide more than people admit.", challenge: "Protect your composure in one stressful moment.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "避其銳氣，擊其惰歸。", translation: "Avoid their sharp spirit and strike when it declines.", wisdom: "Patience can create better timing.", challenge: "Do not force one issue at the worst moment.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "無邀正正之旗，勿擊堂堂之陣。", translation: "Do not attack a disciplined formation head-on.", wisdom: "Respect strong systems. Change the angle.", challenge: "Find a different route around one strong resistance point.", chapter: "Chapter 7 · 軍爭篇"),
    StrategyQuote(quote: "圍師必闕，窮寇勿迫。", translation: "When surrounding an army, leave an outlet; do not press desperate enemies too hard.", wisdom: "Give people a way to back down.", challenge: "Offer one face-saving path in a tense situation.", chapter: "Chapter 7 · 軍爭篇"),

    StrategyQuote(quote: "智者之慮，必雜於利害。", translation: "The wise consider both advantage and harm.", wisdom: "Good judgment sees upside and downside together.", challenge: "For one decision, write one benefit and one risk.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "雜於利而務可信也。", translation: "By considering advantage, the work can be trusted.", wisdom: "Optimism needs a practical path.", challenge: "Clarify the real upside of one effort.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "雜於害而患可解也。", translation: "By considering harm, trouble can be resolved.", wisdom: "Risk awareness is not negativity. It is preparation.", challenge: "Name one risk early enough to manage it.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "無恃其不來，恃吾有以待也。", translation: "Do not rely on the enemy not coming; rely on being ready.", wisdom: "Preparedness beats hope.", challenge: "Prepare for one likely problem before it appears.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "無恃其不攻，恃吾有所不可攻也。", translation: "Do not rely on them not attacking; rely on being unattackable.", wisdom: "Build resilience instead of depending on luck.", challenge: "Make one weak point harder to attack.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "將有五危。", translation: "There are five dangerous faults in a commander.", wisdom: "Leadership failure usually comes from predictable weaknesses.", challenge: "Notice which weakness shows up for you under stress.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "必死，可殺也。", translation: "Recklessness can be killed.", wisdom: "Courage without judgment becomes a liability.", challenge: "Avoid one brave but unnecessary risk.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "必生，可虜也。", translation: "Excessive fear of death can be captured.", wisdom: "Overprotection can make you easier to control.", challenge: "Do not let fear of loss make the decision for you.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "忿速，可侮也。", translation: "A quick temper can be provoked.", wisdom: "If others can trigger you, they can steer you.", challenge: "Do not respond immediately to one irritating message.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "廉潔，可辱也。", translation: "Excessive sensitivity to honor can be insulted.", wisdom: "Ego can become a handle others pull.", challenge: "Let one small slight pass without reaction.", chapter: "Chapter 8 · 九變篇"),
    StrategyQuote(quote: "愛民，可煩也。", translation: "Excessive concern for people can be troubled.", wisdom: "Care matters, but leaders must still make hard choices.", challenge: "Make one decision that balances kindness with standards.", chapter: "Chapter 8 · 九變篇"),

    StrategyQuote(quote: "令之以文，齊之以武。", translation: "Command with civility and unify with discipline.", wisdom: "Culture and standards must work together.", challenge: "Be warm in tone but clear in expectation.", chapter: "Chapter 9 · 行軍篇"),
    StrategyQuote(quote: "卒未親附而罰之，則不服。", translation: "Punish troops before they are attached to you, and they will not submit.", wisdom: "Trust must come before correction lands well.", challenge: "Build trust before giving hard feedback.", chapter: "Chapter 9 · 行軍篇"),
    StrategyQuote(quote: "卒已親附而罰不行，則不可用也。", translation: "If troops are attached but discipline is not enforced, they cannot be used.", wisdom: "Warmth without standards becomes weakness.", challenge: "Hold one standard clearly today.", chapter: "Chapter 9 · 行軍篇"),
    StrategyQuote(quote: "令素行以教其民，則民服。", translation: "If orders are consistently enforced, people will obey.", wisdom: "Consistency creates credibility.", challenge: "Be consistent on one expectation.", chapter: "Chapter 9 · 行軍篇"),
    StrategyQuote(quote: "令不素行以教其民，則民不服。", translation: "If orders are not consistently enforced, people will not obey.", wisdom: "Unclear standards create confusion.", challenge: "Clarify one expectation that has become fuzzy.", chapter: "Chapter 9 · 行軍篇"),

    StrategyQuote(quote: "知吾卒之可以擊，而不知敵之不可擊，勝之半也。", translation: "Knowing your troops can attack but not knowing the enemy cannot be attacked is only half victory.", wisdom: "Internal confidence is only half the answer.", challenge: "Check the external reality before acting.", chapter: "Chapter 10 · 地形篇"),
    StrategyQuote(quote: "知敵之可擊，而不知吾卒之不可以擊，勝之半也。", translation: "Knowing the enemy can be attacked but not knowing your troops cannot attack is only half victory.", wisdom: "Opportunity is useless if your team is not ready.", challenge: "Check whether your team has the capacity before saying yes.", chapter: "Chapter 10 · 地形篇"),
    StrategyQuote(quote: "知敵可擊，知吾卒可以擊，而不知地形之不可以戰，勝之半也。", translation: "Knowing both sides but not the terrain is still only half victory.", wisdom: "Context can defeat even good capability.", challenge: "Study the context before pushing a good idea.", chapter: "Chapter 10 · 地形篇"),
    StrategyQuote(quote: "知彼知己，勝乃不殆。", translation: "Know the enemy and know yourself, and victory will not be in danger.", wisdom: "Clarity lowers risk.", challenge: "Gather one missing fact before making a decision.", chapter: "Chapter 10 · 地形篇"),
    StrategyQuote(quote: "知天知地，勝乃可全。", translation: "Know heaven and earth, and victory can be complete.", wisdom: "Timing plus context creates full advantage.", challenge: "Ask whether the timing and environment support your plan.", chapter: "Chapter 10 · 地形篇"),

    StrategyQuote(quote: "投之亡地然後存。", translation: "Place them in desperate ground, and they will survive.", wisdom: "Pressure can reveal hidden strength.", challenge: "Use one constraint to sharpen your focus.", chapter: "Chapter 11 · 九地篇"),
    StrategyQuote(quote: "陷之死地然後生。", translation: "Put them in deadly ground, and they will live.", wisdom: "Commitment changes behavior.", challenge: "Remove one easy escape from an important goal.", chapter: "Chapter 11 · 九地篇"),
    StrategyQuote(quote: "兵之情主速。", translation: "The nature of war is speed.", wisdom: "When the path is clear, do not drift.", challenge: "Move quickly on one decision that is already clear.", chapter: "Chapter 11 · 九地篇"),
    StrategyQuote(quote: "始如處女，敵人開戶。", translation: "At first be like a maiden, and the enemy opens the door.", wisdom: "Patience can lower resistance.", challenge: "Start gently in one conversation where resistance is high.", chapter: "Chapter 11 · 九地篇"),
    StrategyQuote(quote: "後如脫兔，敵不及拒。", translation: "Then be like a released hare, and the enemy cannot respond.", wisdom: "When the opening appears, move fast.", challenge: "Act quickly when a real opportunity opens today.", chapter: "Chapter 11 · 九地篇"),

    StrategyQuote(quote: "主不可以怒而興師，將不可以慍而致戰。", translation: "A ruler must not raise an army in anger, nor a commander fight from resentment.", wisdom: "Do not make strategic decisions from temporary emotion.", challenge: "Delay one decision if anger is driving it.", chapter: "Chapter 12 · 火攻篇"),
    StrategyQuote(quote: "怒可以復喜，慍可以復悅。", translation: "Anger can turn again to joy; resentment can turn again to pleasure.", wisdom: "Feelings change. Consequences may not.", challenge: "Wait before sending one emotional response.", chapter: "Chapter 12 · 火攻篇"),
    StrategyQuote(quote: "亡國不可以復存，死者不可以復生。", translation: "A ruined state cannot be restored, and the dead cannot be brought back to life.", wisdom: "Some decisions are irreversible. Treat them with care.", challenge: "Identify one decision today that should not be rushed.", chapter: "Chapter 12 · 火攻篇"),

    StrategyQuote(quote: "先知者，不可取於鬼神。", translation: "Foreknowledge cannot be obtained from spirits.", wisdom: "Do not confuse hope with intelligence.", challenge: "Replace one guess with real information.", chapter: "Chapter 13 · 用間篇"),
    StrategyQuote(quote: "不可象於事，不可驗於度。", translation: "It cannot be gained by analogy or calculation alone.", wisdom: "Past patterns help, but real information matters.", challenge: "Do not rely only on analogy for one decision.", chapter: "Chapter 13 · 用間篇"),
    StrategyQuote(quote: "必取於人，知敵之情者也。", translation: "It must be obtained from people who know the enemy's situation.", wisdom: "Get close to the source of truth.", challenge: "Talk to one person who actually knows the situation.", chapter: "Chapter 13 · 用間篇")
]

func chapterKey(for quote: StrategyQuote) -> String {
    return quote.chapter.components(separatedBy: "·").first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? quote.chapter
}

struct SeededRandomNumberGenerator: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        self.state = seed
    }

    mutating func next() -> UInt64 {
        state &+= 0x9E3779B97F4A7C15
        var result = state
        result = (result ^ (result >> 30)) &* 0xBF58476D1CE4E5B9
        result = (result ^ (result >> 27)) &* 0x94D049BB133111EB
        return result ^ (result >> 31)
    }
}

func quoteDayNumber(for date: Date, calendar: Calendar = .current) -> Int {
    let startOfDay = calendar.startOfDay(for: date)
    return calendar.dateComponents(
        [.day],
        from: Date(timeIntervalSince1970: 0),
        to: startOfDay
    ).day ?? 0
}

func dailyQuoteIndices(for date: Date, calendar: Calendar = .current) -> [Int] {
    let count = strategyQuotes.count
    guard count > 0 else { return [] }

    let targetDayNumber = max(0, quoteDayNumber(for: date, calendar: calendar))
    var recentSelections: [[Int]] = []
    var selectedIndices: [Int] = []

    for dayNumber in 0...targetDayNumber {
        let recentlyUsed = Set(recentSelections.flatMap { $0 })
        selectedIndices = seededQuoteIndices(for: dayNumber, avoiding: recentlyUsed)
        recentSelections.append(selectedIndices)

        if recentSelections.count > 5 {
            recentSelections.removeFirst()
        }
    }

    return selectedIndices
}

func todaysQuoteIndices() -> [Int] {
    dailyQuoteIndices(for: Date())
}

private func seededQuoteIndices(for dayNumber: Int, avoiding recentlyUsed: Set<Int>) -> [Int] {
    let count = strategyQuotes.count
    var generator = SeededRandomNumberGenerator(seed: UInt64(bitPattern: Int64(dayNumber)) ^ 0xD411A7E957A7E9B1)
    let shuffledIndices = Array(strategyQuotes.indices).shuffled(using: &generator)
    var selectedIndices: [Int] = []
    var usedChapters: Set<String> = []

    func append(_ index: Int, trackingChapter: Bool = true) {
        selectedIndices.append(index)

        if trackingChapter {
            usedChapters.insert(chapterKey(for: strategyQuotes[index]))
        }
    }

    for index in shuffledIndices where selectedIndices.count < 3 {
        let chapter = chapterKey(for: strategyQuotes[index])

        if !recentlyUsed.contains(index) && !usedChapters.contains(chapter) {
            append(index)
        }
    }

    for index in shuffledIndices where selectedIndices.count < 3 {
        if !recentlyUsed.contains(index) && !selectedIndices.contains(index) {
            append(index, trackingChapter: false)
        }
    }

    for index in shuffledIndices where selectedIndices.count < 3 {
        let chapter = chapterKey(for: strategyQuotes[index])

        if !selectedIndices.contains(index) && !usedChapters.contains(chapter) {
            selectedIndices.append(index)
            usedChapters.insert(chapter)
        }
    }

    for index in shuffledIndices where selectedIndices.count < min(3, count) {
        if !selectedIndices.contains(index) {
            append(index, trackingChapter: false)
        }
    }

    return selectedIndices
}

struct StrategyPracticeEntry: Codable, Identifiable {
    let id: String
    let date: Date
    let quoteIndex: Int
    var decision: String

    var quote: StrategyQuote? {
        guard !strategyQuotes.isEmpty else { return nil }
        return strategyQuotes.indices.contains(quoteIndex) ? strategyQuotes[quoteIndex] : strategyQuotes.first
    }
}

struct StrategyProgress {
    let totalCompletedDays: Int
    let currentStreak: Int
}

struct AppBuildInfo {
    static var displayVersion: String {
        let baseVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.1"
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0"
        return "Version \(baseVersion).\(buildNumber)"
    }
}

class StrategyPracticeStore: ObservableObject {
    @Published private(set) var entries: [StrategyPracticeEntry] = []

    private let storageKey = "daily_strategy_practice_entries"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init() {
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        load()
    }

    var sortedEntries: [StrategyPracticeEntry] {
        entries.sorted { $0.date > $1.date }
    }

    var progress: StrategyProgress {
        let completedDates = Set(entries.map { dayKey(for: $0.date) })
        return StrategyProgress(
            totalCompletedDays: completedDates.count,
            currentStreak: currentStreak(from: completedDates)
        )
    }

    func entry(for date: Date, quoteIndex: Int) -> StrategyPracticeEntry? {
        let id = entryID(for: date, quoteIndex: quoteIndex)
        return entries.first { $0.id == id }
    }

    func saveEntry(for date: Date, quoteIndex: Int, decision: String) {
        let trimmedDecision = decision.trimmingCharacters(in: .whitespacesAndNewlines)
        let id = entryID(for: date, quoteIndex: quoteIndex)

        if let existingIndex = entries.firstIndex(where: { $0.id == id }) {
            if trimmedDecision.isEmpty {
                entries.remove(at: existingIndex)
            } else {
                entries[existingIndex].decision = trimmedDecision
            }
        } else if !trimmedDecision.isEmpty {
            entries.append(
                StrategyPracticeEntry(
                    id: id,
                    date: Calendar.current.startOfDay(for: date),
                    quoteIndex: quoteIndex,
                    decision: trimmedDecision
                )
            )
        }

        save()
    }

    func deleteEntry(for date: Date, quoteIndex: Int) {
        let id = entryID(for: date, quoteIndex: quoteIndex)
        entries.removeAll { $0.id == id }
        save()
    }

    func deleteAllEntries() {
        entries = []
        UserDefaults.standard.removeObject(forKey: storageKey)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decodedEntries = try? decoder.decode([StrategyPracticeEntry].self, from: data) else {
            entries = []
            return
        }

        entries = decodedEntries
    }

    private func save() {
        guard let data = try? encoder.encode(entries) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func currentStreak(from completedDates: Set<String>) -> Int {
        var streak = 0
        var date = Calendar.current.startOfDay(for: Date())

        while completedDates.contains(dayKey(for: date)) {
            streak += 1

            guard let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: date) else {
                break
            }

            date = previousDay
        }

        return streak
    }

    private func entryID(for date: Date, quoteIndex: Int) -> String {
        "\(dayKey(for: date))-\(quoteIndex)"
    }

    private func dayKey(for date: Date) -> String {
        Self.dayKeyFormatter.string(from: Calendar.current.startOfDay(for: date))
    }

    private static let dayKeyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

class NotificationManager {
    static let shared = NotificationManager()

    enum ScheduleResult {
        case scheduled
        case denied
        case failed
    }

    func requestPermissionAndSchedule(completion: ((ScheduleResult) -> Void)? = nil) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                self.scheduleNext30DaysMorningQuotes { success in
                    DispatchQueue.main.async {
                        completion?(success ? .scheduled : .failed)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion?(.denied)
                }
            }
        }
    }

    func scheduleNext30DaysMorningQuotes(completion: ((Bool) -> Void)? = nil) {
        let center = UNUserNotificationCenter.current()
        let calendar = Calendar.current
        let notificationDates = nextMorningNotificationDates(count: 30, calendar: calendar)
        let newIdentifiers = notificationDates.map { notificationIdentifier(for: $0, calendar: calendar) }

        center.getPendingNotificationRequests { requests in
            let staleIdentifiers = requests
                .map(\.identifier)
                .filter { $0 == "daily_strategy_quote" || $0.hasPrefix("daily_strategy_quote_") }

            center.removePendingNotificationRequests(withIdentifiers: staleIdentifiers + newIdentifiers)

            let group = DispatchGroup()
            var schedulingSucceeded = true

            for date in notificationDates {
                let quoteIndices = dailyQuoteIndices(for: date, calendar: calendar)
                guard !quoteIndices.isEmpty else { continue }

                let rotatedIndex = quoteDayNumber(for: date, calendar: calendar) % quoteIndices.count
                let quote = strategyQuotes[quoteIndices[rotatedIndex]]

                let content = UNMutableNotificationContent()
                content.title = "Daily Strategy"
                content.subtitle = quote.quote
                content.body = quote.challenge
                content.sound = .default

                let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                let request = UNNotificationRequest(
                    identifier: self.notificationIdentifier(for: date, calendar: calendar),
                    content: content,
                    trigger: trigger
                )

                group.enter()
                center.add(request) { error in
                    if error != nil {
                        schedulingSucceeded = false
                    }

                    group.leave()
                }
            }

            group.notify(queue: .main) {
                completion?(schedulingSucceeded)
            }
        }
    }

    func disableDailyReminders(completion: (() -> Void)? = nil) {
        let center = UNUserNotificationCenter.current()

        center.getPendingNotificationRequests { requests in
            let identifiers = self.dailyReminderIdentifiers(from: requests)
            center.removePendingNotificationRequests(withIdentifiers: identifiers)

            DispatchQueue.main.async {
                completion?()
            }
        }
    }

    func remindersScheduled(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            let hasDailyReminder = !self.dailyReminderIdentifiers(from: requests).isEmpty

            DispatchQueue.main.async {
                completion(hasDailyReminder)
            }
        }
    }

    private func nextMorningNotificationDates(count: Int, calendar: Calendar) -> [Date] {
        guard count > 0 else { return [] }

        let now = Date()
        var startDate = calendar.startOfDay(for: now)
        var morning = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: startDate) ?? startDate

        if morning <= now {
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate) ?? startDate
            morning = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: startDate) ?? startDate
        }

        return (0..<count).compactMap { offset in
            calendar.date(byAdding: .day, value: offset, to: morning)
        }
    }

    private func notificationIdentifier(for date: Date, calendar: Calendar) -> String {
        "daily_strategy_quote_\(quoteDayNumber(for: date, calendar: calendar))"
    }

    private func dailyReminderIdentifiers(from requests: [UNNotificationRequest]) -> [String] {
        requests
            .map(\.identifier)
            .filter { $0 == "daily_strategy_quote" || $0.hasPrefix("daily_strategy_quote_") }
    }
}

struct ContentView: View {
    @StateObject private var practiceStore = StrategyPracticeStore()
    @State private var todayIndices = todaysQuoteIndices()
    @State private var selectedDailyQuote = 0
    @State private var decisionText = ""
    @State private var completionMessage = ""

    var currentQuote: StrategyQuote? {
        guard let index = currentQuoteIndex else { return nil }
        return strategyQuotes[index]
    }

    var currentQuoteIndex: Int? {
        guard !todayIndices.isEmpty else { return nil }

        let boundedSelection = min(max(selectedDailyQuote, 0), todayIndices.count - 1)
        let index = todayIndices[boundedSelection]
        guard strategyQuotes.indices.contains(index) else { return nil }

        return index
    }

    var currentEntry: StrategyPracticeEntry? {
        guard let currentQuoteIndex else { return nil }
        return practiceStore.entry(for: Date(), quoteIndex: currentQuoteIndex)
    }

    var displayedStrategyNumber: Int {
        guard !todayIndices.isEmpty else { return 0 }
        return min(max(selectedDailyQuote, 0), todayIndices.count - 1) + 1
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    Text("每日一策")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Daily Strategy")
                        .font(.title3)
                        .foregroundStyle(.secondary)

                    Text("Three strategies for today")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    if let currentQuote {
                        Text("Strategy \(displayedStrategyNumber) of \(todayIndices.count)")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        StrategyCard(title: "Original Quote", text: currentQuote.quote, isChinese: true)
                        StrategyCard(title: "Translation", text: currentQuote.translation)
                        StrategyCard(title: "Applied Wisdom", text: currentQuote.wisdom)
                        StrategyCard(title: "Today's Challenge", text: currentQuote.challenge)

                        ProgressSummaryView(progress: practiceStore.progress)

                        PracticeCard(
                            decisionText: $decisionText,
                            isComplete: currentEntry != nil,
                            completionMessage: completionMessage,
                            onComplete: markChallengeComplete,
                            onClear: clearTodayEntry
                        )

                        Text(currentQuote.chapter)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("Sun Tzu · The Art of War")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    } else {
                        ContentUnavailableView(
                            "No Strategy Available",
                            systemImage: "exclamationmark.triangle",
                            description: Text("Daily Strategy could not load today's practice.")
                        )
                    }

                    HStack {
                        Button {
                            if selectedDailyQuote > 0 {
                                selectedDailyQuote -= 1
                            }
                        } label: {
                            Label("Previous", systemImage: "chevron.left")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .disabled(selectedDailyQuote == 0)

                        Button {
                            if selectedDailyQuote < todayIndices.count - 1 {
                                selectedDailyQuote += 1
                            }
                        } label: {
                            Label("Next", systemImage: "chevron.right")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(todayIndices.isEmpty || selectedDailyQuote >= todayIndices.count - 1)
                    }

                    if !todayIndices.isEmpty && selectedDailyQuote == todayIndices.count - 1 {
                        Text("You have completed today’s three strategies. Come back tomorrow for three new reflections.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    }

                    NavigationLink {
                        HistoryView(entries: practiceStore.sortedEntries)
                    } label: {
                        Label("Practice History", systemImage: "clock.arrow.circlepath")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)

                    NavigationLink {
                        SettingsView(
                            practiceStore: practiceStore,
                            onDeleteAllPracticeData: refreshCurrentPractice
                        )
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)

                    Text("\(strategyQuotes.count) curated passages")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
            .navigationTitle("Daily Practice")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            todayIndices = todaysQuoteIndices()
            selectedDailyQuote = boundedSelectionIndex()
            loadDecisionForSelectedQuote()
        }
        .onChange(of: selectedDailyQuote) { _, _ in
            let boundedIndex = boundedSelectionIndex()
            if selectedDailyQuote != boundedIndex {
                selectedDailyQuote = boundedIndex
            }

            loadDecisionForSelectedQuote()
        }
    }

    private func loadDecisionForSelectedQuote() {
        decisionText = currentEntry?.decision ?? ""
        completionMessage = ""
    }

    private func refreshCurrentPractice() {
        loadDecisionForSelectedQuote()
    }

    private func markChallengeComplete() {
        guard let currentQuoteIndex else { return }
        practiceStore.saveEntry(for: Date(), quoteIndex: currentQuoteIndex, decision: decisionText)
        decisionText = currentEntry?.decision ?? decisionText.trimmingCharacters(in: .whitespacesAndNewlines)
        completionMessage = currentEntry == nil ? "" : "Challenge saved for today"
    }

    private func clearTodayEntry() {
        guard let currentQuoteIndex else { return }
        practiceStore.deleteEntry(for: Date(), quoteIndex: currentQuoteIndex)
        decisionText = ""
        completionMessage = ""
    }

    private func boundedSelectionIndex() -> Int {
        guard !todayIndices.isEmpty else { return 0 }
        return min(max(selectedDailyQuote, 0), todayIndices.count - 1)
    }
}

struct StrategyCard: View {
    let title: String
    let text: String
    var isChinese: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.secondary)

            Text(text)
                .font(isChinese ? .title : .body)
                .fontWeight(isChinese ? .medium : .regular)
                .multilineTextAlignment(isChinese ? .center : .leading)
                .frame(maxWidth: .infinity, alignment: isChinese ? .center : .leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct ProgressSummaryView: View {
    let progress: StrategyProgress

    var body: some View {
        HStack(spacing: 12) {
            ProgressMetric(title: "Completed Days", value: "\(progress.totalCompletedDays)")
            ProgressMetric(title: "Current Streak", value: "\(progress.currentStreak)")
        }
    }
}

struct ProgressMetric: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct PracticeCard: View {
    @Binding var decisionText: String
    let isComplete: Bool
    let completionMessage: String
    let onComplete: () -> Void
    let onClear: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("My Decision Today")
                .font(.headline)
                .foregroundStyle(.secondary)

            TextEditor(text: $decisionText)
                .frame(minHeight: 110)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(alignment: .topLeading) {
                    if decisionText.isEmpty {
                        Text("Write the decision, situation, or reflection you will apply this strategy to.")
                            .foregroundStyle(.tertiary)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 16)
                            .allowsHitTesting(false)
                    }
                }

            Button(action: onComplete) {
                Label(
                    isComplete ? "Update Completed Challenge" : "Mark Challenge Complete",
                    systemImage: isComplete ? "checkmark.circle.fill" : "checkmark.circle"
                )
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(decisionText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

            if isComplete {
                Button(role: .destructive, action: onClear) {
                    Label("Clear Today's Entry", systemImage: "trash")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }

            if !completionMessage.isEmpty {
                Text(completionMessage)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct HistoryView: View {
    let entries: [StrategyPracticeEntry]

    var body: some View {
        Group {
            if entries.isEmpty {
                ContentUnavailableView(
                    "No Completed Challenges",
                    systemImage: "square.and.pencil",
                    description: Text("Saved decisions and reflections will appear here after you complete a daily challenge.")
                )
            } else {
                List(entries) { entry in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(entry.date, style: .date)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        if let quote = entry.quote {
                            Text(quote.quote)
                                .font(.title3)
                                .fontWeight(.medium)

                            Text(quote.challenge)
                                .font(.subheadline)
                        }

                        Text(entry.decision)
                            .font(.body)
                            .padding(.top, 4)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Practice History")
    }
}

struct SettingsView: View {
    @ObservedObject var practiceStore: StrategyPracticeStore
    let onDeleteAllPracticeData: () -> Void
    @State private var remindersScheduled = false
    @State private var reminderMessage = ""
    @State private var showingDeleteConfirmation = false

    var body: some View {
        List {
            Section {
                Text("Daily Strategy can send one local reminder each morning. Notifications stay on this device.")
                    .foregroundStyle(.secondary)

                Label(
                    remindersScheduled ? "Daily reminders scheduled" : "Daily reminders disabled",
                    systemImage: remindersScheduled ? "bell.badge" : "bell.slash"
                )

                Button {
                    NotificationManager.shared.requestPermissionAndSchedule { result in
                        switch result {
                        case .scheduled:
                            reminderMessage = "8 AM daily reminders scheduled for the next 30 days"
                        case .denied:
                            reminderMessage = "Notification permission was not granted"
                        case .failed:
                            reminderMessage = "Daily reminders could not be scheduled. Please try again."
                        }

                        refreshReminderStatus()
                    }
                } label: {
                    Label("Enable Daily Reminder", systemImage: "bell")
                }

                Button(role: .destructive) {
                    NotificationManager.shared.disableDailyReminders {
                        reminderMessage = "Daily reminders disabled"
                        refreshReminderStatus()
                    }
                } label: {
                    Label("Disable Daily Reminder", systemImage: "bell.slash")
                }
                .disabled(!remindersScheduled)

                if !reminderMessage.isEmpty {
                    Text(reminderMessage)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Reminders")
            }

            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Your practice entries stay on this device.")
                        .font(.headline)

                    Text("Daily Strategy does not use accounts, cloud sync, tracking, ads, analytics, or subscriptions. Your saved decisions and reflections are stored locally only.")
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)

                Link(destination: privacyPolicyURL) {
                    Label("Privacy Policy", systemImage: "doc.text")
                }
            } header: {
                Text("Privacy")
            }

            Section {
                Label("No login", systemImage: "person.crop.circle.badge.xmark")
                Label("No cloud sync", systemImage: "icloud.slash")
                Label("No tracking", systemImage: "eye.slash")
                Label("No analytics or ads", systemImage: "chart.bar.xaxis")
            } header: {
                Text("Data Use")
            }

            Section {
                Button(role: .destructive) {
                    showingDeleteConfirmation = true
                } label: {
                    Label("Delete All Practice Data", systemImage: "trash")
                }
                .disabled(practiceStore.entries.isEmpty)
            } footer: {
                Text("This removes all saved practice history from this device. The quote library is not changed.")
            }

            Section {
                Text("\(strategyQuotes.count) curated passages")
                Text(AppBuildInfo.displayVersion)
            } header: {
                Text("App")
            }
        }
        .navigationTitle("Settings")
        .onAppear {
            refreshReminderStatus()
        }
        .alert("Delete all practice data?", isPresented: $showingDeleteConfirmation) {
            Button("Delete All Data", role: .destructive) {
                practiceStore.deleteAllEntries()
                onDeleteAllPracticeData()
            }

            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This cannot be undone.")
        }
    }

    private func refreshReminderStatus() {
        NotificationManager.shared.remindersScheduled { scheduled in
            remindersScheduled = scheduled
        }
    }
}

#Preview {
    ContentView()
}
