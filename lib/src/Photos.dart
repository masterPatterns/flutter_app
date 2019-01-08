class Photos {
    const Photos(this.asset, this.id);
    final String asset;
    final int id;

    @override
    bool operator ==(dynamic other) {
        if (runtimeType != other.runtimeType)
            return false;
        final Photos typedOther = other;
        return id == typedOther.id;
    }

    @override
    int get hashCode => id.hashCode;
}