
/// The rating for the gravatar.
enum ASGravatarRating: String {
    case Any = ""

    ///  A Gravatar rating of G can be displayed.
    case G = "&rating=g"

    /// A Gravatar rating of PG can be displayed.
    case PG = "&rating=pg"

    /// A Gravatar rating of R can be displayed.
    case R = "&rating=r"

    /// A Gravatar rating of X can be displayed.
    case X = "&rating=x"
}

enum ASDefaultGravatar: String {

    /// No default Gravatar.
    case None = ""

    /// 404 Gravatar.
    case _404 = "&default=404"

    /// Myster Man Gravatar.
    case MysteryMan = "&default=mm"

    /// Identicon Gravatar.
    case Identicon = "&default=identicon"

    /// Monster ID Gravatar.
    case MonsterID = "&default=monsterid"

    ///  Wavatar Gravatar.
    case Wavatar = "&default=wavatar"

    /// Retro Gravatar
    case Retro = "&default=retro"

    /// Blank Gravatar.
    case Blank = "&default=blank"
}

class ASGravatarImageView: UIImageView {
    var size: Int?
    var rating: ASGravatarRating?
    var defaultGravatar: ASDefaultGravatar?

    init(_ email: String, placeholder: UIImage? = nil) {
        super.init(image: placeholder)
        self.email = email
        self.placeholder = placeholder
        contentMode(.ScaleAspectFit)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func load() -> Self{
        downloadedFrom(gravatarPath)
        return self
    }

    private var gravatarPath: String {
        return "http://gravatar.com/avatar/\(email.md5())?" + argumnets
    }

    private var argumnets: String {
        var result: String = ""
        if (size != nil) {
            result += "&size=\(size)"
        }
        if (rating != nil) {
            result += rating!.rawValue
        }
        if (defaultGravatar != nil) {
            result += defaultGravatar!.rawValue
        }
        return result
    }

    private var placeholder: UIImage?
    private var email: String!
}
