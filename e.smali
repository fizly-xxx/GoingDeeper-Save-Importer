.class public Lh1/e;
.super Ljava/lang/Object;
.source "AndroidPurchaseAdapter.java"

# interfaces
.implements Lj1/j;


# instance fields
.field private a:Lcom/android/billingclient/api/a;
.field private b:Z
.field private c:Z
.field d:Ljava/lang/String;
.field e:Lcom/android/billingclient/api/f;
.field g:Lcom/kirill_skibin/going_deeper/AndroidLauncher;
.field h:Lj1/k;


# direct methods
.method public constructor <init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    # Init game state manager
    invoke-static {}, Lj1/k;->f()Lj1/k;
    move-result-object v0
    iput-object v0, p0, Lh1/e;->h:Lj1/k;

    .line 3
    # Store launcher context
    iput-object p1, p0, Lh1/e;->g:Lcom/kirill_skibin/going_deeper/AndroidLauncher;

    return-void
.end method


# virtual methods

.method public a()V
    .locals 1

    .line 1
    # Check IAP on startup and bypass
    iget-object v0, p0, Lh1/e;->h:Lj1/k;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lj1/k;->b()V

    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    # Handle purchase button click (grant PRO immediately)
    iget-object v0, p0, Lh1/e;->h:Lj1/k;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lj1/k;->b()V

    :cond_0
    return-void
.end method

.method public j()Z
    .locals 1

    .line 1
    # Force isPurchased check to always return true
    const/4 v0, 0x1

    return v0
.end method

.method public l()V
    .locals 0
    # Stub

    return-void
.end method

.method public m(Z)V
    .locals 0
    # Stub

    return-void
.end method