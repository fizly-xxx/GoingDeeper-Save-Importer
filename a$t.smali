.class Lb2/a$t;
.super Ln1/p;
.source "MainMenuInterfaceState.java"

# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb2/a;->I()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Q:Lb2/a;


# direct methods
.method constructor <init>(Lb2/a;Lm1/j;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb2/a$t;->Q:Lb2/a;

    .line 2
    invoke-direct {p0, p2, p3, p4}, Ln1/p;-><init>(Lm1/j;Ljava/lang/String;I)V

    .line 4
    return-void
.end method


# virtual methods
.method public p()V
    .locals 3

    .line 1
    # Keep original click sound/animation
    invoke-super {p0}, Ln1/p;->p()V

    # Fetch static activity instance
    sget-object v0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->myActivity:Lcom/kirill_skibin/going_deeper/AndroidLauncher;

    # Setup file picker intent
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.GET_CONTENT"
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    # Allow all MIME types
    const-string v2, "*/*"
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    # Launch file picker (RequestCode: 0x270f)
    const/16 v2, 0x270f
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method